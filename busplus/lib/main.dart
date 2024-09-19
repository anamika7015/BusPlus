import 'package:busplus/screens/home_screen.dart';
import 'package:busplus/screens/login_screen.dart';
import 'package:busplus/screens/signup_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "HomeScreen()",
      routes: {
        "/": (context) =>const HomeScreen(),
        "/home": (context) => const HomeScreen(),
        "/login": (context) => LoginScreen(),
        "/signup": (context) => const SignUpScreen(),
        
      },
    );
  }
}