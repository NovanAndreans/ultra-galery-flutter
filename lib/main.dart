import 'package:flutter/material.dart';
import 'package:ultraman/screens/homepage.dart';
import 'package:ultraman/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ultra Gallery',
      home: login(),
    );
  }
}
