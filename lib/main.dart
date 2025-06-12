import 'package:flutter/material.dart';
import 'package:flutterapioractice/Homescreen.dart';
import 'package:flutterapioractice/Screen/User.dart';
import 'package:flutterapioractice/UserScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const UserScreen(),
    );
  }
}
