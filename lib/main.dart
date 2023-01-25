import 'package:flutter/material.dart';
import 'package:mapd722_pay_calculator_carlos_hernandez/pages/home.dart';

void main() {
  //runApp(const MyApp());
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Starter Template',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Home(),
    );
  }
}