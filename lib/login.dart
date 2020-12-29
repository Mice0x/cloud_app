import 'package:flutter/material.dart';
import 'package:ssh/ssh.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void login_ftp() {
    var client = new SSHClient(
        host: "10.0.0.6", port: 23, username: "pi", passwordOrKey: "12345");
    client.connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: FractionallySizedBox(
          widthFactor: 0.8,
          child: Column(children: <Widget>[
            Expanded(
              child: Icon(
                Icons.cloud_circle,
                color: Colors.amber,
                size: 120,
              ),
            ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: "Username",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0))),
              ),
            ),
            Expanded(
                child: TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0))),
            )),
            Expanded(
                child: FractionallySizedBox(
              heightFactor: 0.3,
              child: OutlineButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      side: BorderSide(color: Colors.red)),
                  color: Colors.red,
                  onPressed: login_ftp,
                  child: Text(
                    'LogIn',
                    style: TextStyle(fontSize: 30),
                  )),
            ))
          ]),
        ),
      ),
    );
  }
}
