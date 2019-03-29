import 'package:flutter/material.dart';
import 'register.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Logo
  Widget showLogo() {
    return Image.asset('images/logo.png');
  }

  // App Name
  Widget showText() {
    return Text(
      'ระบบใส่ข้อมูล',
      style: TextStyle(
          fontFamily: 'Taviraj',
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.redAccent[700]),
    );
  }

  // Email TextField
  Widget emailTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelStyle: TextStyle(color: Colors.white),
          labelText: 'Email Address:',
          hintText: 'you@mail.com'),
    );
  }

  // Password TextField
  Widget passwordTextField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Password: ',
          hintText: 'more 6 Charator',
          labelStyle: TextStyle(color: Colors.yellow)),
    );
  }

  // Buttom Signin
  Widget signInButton() {
    return RaisedButton(
      color: Colors.yellowAccent,
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.blue[900]),
      ),
      onPressed: () {
        print('You Click SignIN');
      },
    );
  }

  // Buttom Signup
  Widget signUpButton(BuildContext context) {
    return RaisedButton(
      color: Colors.red[600],
      child: Text(
        'Sing Up',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        print('You Click SignUp');
        var registerRouter = new MaterialPageRoute(
            builder: (BuildContext context) => Register());
        Navigator.of(context).push(registerRouter);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blue[700], Colors.blue[100]],
              begin: Alignment(-1, -1))),
      padding: EdgeInsets.only(top: 30.0),
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          showLogo(),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: showText(),
          ),
          Container(
            margin: EdgeInsets.only(left: 50.0, right: 50.0),
            child: emailTextField(),
          ),
          Container(
            margin: EdgeInsets.only(left: 50.0, right: 50.0),
            child: passwordTextField(),
          ),
          Container(
            margin: EdgeInsets.only(left: 50.0, right: 50.0),
            child: Row(
              children: <Widget>[
                new Expanded(
                  child: signInButton(),
                ),
                new Expanded(
                  child: signUpButton(context),
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
