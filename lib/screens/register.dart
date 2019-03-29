import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
// Explicit
  String nameString, emailString, passwordString;

// Key
  final formKey = GlobalKey<FormState>();

//name
  Widget nameTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Name :', hintText: 'Type Your Name'),
      validator: (String value) {
        if (value.length == 0) {
          return 'Please Type Name ?';
        }
      },
      onSaved: (String value) {
        nameString = value;
      },
    );
  }

//email
  Widget emailTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Email', hintText: 'Type you Email'),
      validator: (String value) {
        if (!((value.contains('@')) && (value.contains('.')))) {
          return 'Please Type Email Format';
        }
      },
      onSaved: (String value) {
        emailString = value;
      },
    );
  }

//Password
  Widget passwordTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Password', hintText: 'more 6 Charlator'),
      validator: (String value) {
        if (value.length <= 5) {
          return 'Please Type more 6 charator';
        }
      },
      onSaved: (String value) {
        passwordString = value;
      },
    );
  }

  void clickCloudUpload(BuildContext context) async{
    print('Click Cloud Upload');
    print(formKey.currentState.validate());
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      print('name => $nameString, email => $emailString, password => $passwordString ');
      String urlString = 'https://www.androidthai.in.th/poy/addDataTong.php?isAdd=true&Name=$nameString&Email=$emailString&Password=$passwordString';

      var response =await get(urlString);
      var result =jsonDecode(response.body);
      print(result);

      if(result.toString()== 'true'){
        Navigator.pop(context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Register'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.cloud_upload),
              tooltip: 'Upload to Server',
              onPressed: () {
                clickCloudUpload(context);
              },
            )
          ],
        ),
        body: Form(
          key: formKey,
          child: Container(
            padding: EdgeInsets.all(30.0),
            child: Container(
              padding: EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                      width: 2.0,
                      color: Colors.blue,
                      style: BorderStyle.solid)),
              child: Column(
                children: <Widget>[
                  nameTextField(),
                  emailTextField(),
                  passwordTextField()
                ],
              ),
            ),
          ),
        ));
  }
}
