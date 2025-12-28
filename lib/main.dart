import 'package:flutter/material.dart';
import 'package:nepal_tea_and_coffee/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: ' 🧑🍵 Nepal Tea & Coffee Enthusiast Group ☕👩',
      title: ' 🧑🍵 Nepal Tea & Coffee Group ☕👩',
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        brightness: Brightness.dark,
        // brightness: Brightness.light,

        // primarySwatch: Colors.green,
      ),

      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      home: const HomePage(),
    );
  }
}
