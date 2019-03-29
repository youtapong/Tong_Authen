import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
//name
  Widget nameTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Name :', hintText: 'Type Your Name'),
    );
  }

//email
  Widget emailTextField() {
    return TextFormField(
      decoration:
          InputDecoration(labelText: 'Email', hintText: 'Type you Email'),
    );
  }

//Password
  Widget passwordTextField() {
    return TextField(
      decoration:
          InputDecoration(labelText: 'Password', hintText: 'more 6 Charlator'),
    );
  }
  void clickCloudUpload() {
    print('Click Cloud Upload');
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
            tooltip: 'Upload to Server', onPressed: () {clickCloudUpload();},
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Container(
          padding: EdgeInsets.all(30.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  width: 2.0, color: Colors.blue, style: BorderStyle.solid)),
          child: Column(
            children: <Widget>[
              nameTextField(),
              emailTextField(),
              passwordTextField()
            ],
          ),
        ),
      ),
    );
  }
}
