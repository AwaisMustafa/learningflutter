import 'package:flutter/material.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
      child: Text(
      'Welcome to Home Screen!',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    ),
    ),
    );
  }
}
