import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'HomePage.dart';


void main() {
  runApp ( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Halaman awal adalah halaman login
    );
  }
}