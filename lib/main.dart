import 'package:flutter/material.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Material(
        child:Center(
        child: Container(
        child: Text("Welcome"),
      ),
      ),
      ),
    );
  }
}
