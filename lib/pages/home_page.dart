import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int days = 10;
    return Scaffold(
      appBar: AppBar(
        title: Text("DoomStock"),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome , Its ${days} days"),
        ),
      ),
      drawer: Drawer(),
    );
  }
}
