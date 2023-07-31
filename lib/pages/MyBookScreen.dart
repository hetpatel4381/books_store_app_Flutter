import 'package:flutter/material.dart';

class MyBookScreen extends StatelessWidget {
  const MyBookScreen
({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "My Book Page",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}