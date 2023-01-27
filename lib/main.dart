import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/home_page.dart';
import 'pages/login-page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData(
          primarySwatch: Colors.pink,
          fontFamily: GoogleFonts.lato().fontFamily),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage()
      },
    );
  }
}
