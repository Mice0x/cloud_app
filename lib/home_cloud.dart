import 'package:flutter/material.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:ssh/ssh.dart';

class HomeCloud extends StatefulWidget {
  @override
  _HomeCloudState createState() => _HomeCloudState();
}

class _HomeCloudState extends State<HomeCloud> {
  final client = SSHClient(
      host: "10.0.0.6", port: 23, username: "pi", passwordOrKey: "12345");
  @override
  void initState() {
    super.initState();
    client.connect();
    BackButtonInterceptor.add(myInterceptor);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(myInterceptor);
    super.dispose();
  }

  bool myInterceptor(bool stopDefaultButtonEvent, RouteInfo info) {
    print("BACK BUTTON!"); // Do some stuff.
    return true;
  }

  void logout() {
    Navigator.pop(context);
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: FractionallySizedBox(
      heightFactor: 0.9,
      widthFactor: 0.9,
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          width: 100,
          height: 20,
          child: FlatButton(onPressed: logout, child: Text("LogOut")),
        ),
      ),
    )));
  }
}
