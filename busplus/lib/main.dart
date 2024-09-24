import 'package:busplus/screens/home_screen.dart';
import 'package:busplus/screens/login_screen.dart';
import 'package:busplus/screens/signup_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "HomeScreen()",
      routes: {
        "/": (context) => const HomeScreen(),
        "/home": (context) => const HomeScreen(),
        "/login": (context) => const LoginScreen(),
        "/signup": (context) => const SignUpScreen(),
      },
    );
  }
}
