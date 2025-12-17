import 'package:flutter/material.dart';
import 'package:nepal_tea_and_coffee/account_tab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: '🍵 Nepal Tea & Coffee Enthusiast Group (NTCEG) ☕',),
      appBar: AppBar(
        // title: Text('🍵 Nepal Tea & Coffee Enthusiast Group ☕'),
        title: Text('🍵 Nepal Tea & Coffee Enthusiasts ☕'),
      ),
      body: AccountTab(),
    );
  }
}
