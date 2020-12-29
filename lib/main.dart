import 'package:flutter/material.dart';
import 'package:cloud_app/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Colors.red,
          brightness: Brightness.dark,
          primaryColor: Colors.amber),
      title: 'Login',
      home: LoginPage(),
    );
  }
}
