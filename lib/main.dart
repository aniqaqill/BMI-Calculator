import 'package:flutter/material.dart';
import 'bmi_calculator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      // home: const MyHomePage(title: 'Aniq BMI Calculator'),
      home: const BMICalculator(),
    );
  }
}
