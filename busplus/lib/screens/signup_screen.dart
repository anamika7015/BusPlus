import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SignUpScreen(),
      routes: {
        '/notifications': (context) => const NotificationsScreen(),
      },
    );
  }
}

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  final TextEditingController busNameController = TextEditingController();
  final TextEditingController busNumberController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  String generatedOtp = '';
  bool isOtpVisible = false;
  bool isBusNameVisible = false;
  bool isBusNumberVisible = false;

  void sendOtp() {
    // Simulate OTP generation
    final random = Random();
    generatedOtp = (100000 + random.nextInt(900000)).toString();
    print('Generated OTP: $generatedOtp'); // In a real app, send this OTP to the user's phone number
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('OTP sent to ${phoneController.text}')),
    );
  }

  void verifyOtp() {
    if (otpController.text == generatedOtp) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('OTP verified successfully')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Invalid OTP')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('BUS PLUS'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.pushNamed(context, '/notifications');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                'Sign Up',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  labelText: 'First Name',
                  border: OutlineInputBorder(),
                  hintText: 'Enter your First name',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                  border: OutlineInputBorder(),
                  hintText: 'Enter your Last name',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(),
                  hintText: 'Enter mobile number',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: sendOtp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('OTP'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: otpController,
                decoration: InputDecoration(
                  labelText: 'Enter OTP',
                  border: const OutlineInputBorder(),
                  hintText: '',
                  suffixIcon: IconButton(
                    icon: Icon(
                      isOtpVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isOtpVisible = !isOtpVisible;
                      });
                    },
                  ),
                ),
                obscureText: !isOtpVisible,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: busNameController,
                decoration: InputDecoration(
                  labelText: 'Enter Bus Name',
                  border: const OutlineInputBorder(),
                  hintText: 'Enter Bus Name',
                  suffixIcon: IconButton(
                    icon: Icon(
                      isBusNameVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isBusNameVisible = !isBusNameVisible;
                      });
                    },
                  ),
                ),
                obscureText: !isBusNameVisible,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: busNumberController,
                decoration: InputDecoration(
                  labelText: 'Enter Bus Number',
                  border: const OutlineInputBorder(),
                  hintText: 'Enter Bus Number',
                  suffixIcon: IconButton(
                    icon: Icon(
                      isBusNumberVisible ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        isBusNumberVisible = !isBusNumberVisible;
                      });
                    },
                  ),
                ),
                obscureText: !isBusNumberVisible,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: verifyOtp,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text('Sign up'),
              ),
              const SizedBox(height: 16),
              const Text(
                'Login',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Or',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              ElevatedButton.icon(
                onPressed: () {},
                icon: Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png',
                  height: 24,
                  width: 24,
                ),
                label: const Text('Continue with Google'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.white,
                  side: const BorderSide(color: Colors.grey),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: const Center(
        child: Text('No new notifications'),
      ),
    );
  }
}