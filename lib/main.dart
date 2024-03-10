import 'dart:async';
import 'dart:convert';
import 'package:farm_pro/Utilities/CustomWidgets.dart';
import 'package:farm_pro/Utilities/custom.dart';
import 'package:farm_pro/pages/LoginPage.dart';
import 'package:flutter/material.dart';
import 'sample_details.dart';
import 'package:farm_pro/pages/HomePage.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: darkTeal),
        useMaterial3: true,
        scaffoldBackgroundColor: darkTeal,
      ),
      home:  LoginPage(),
    );
  }
}

