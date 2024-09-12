import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Text("Login Form",
            style: TextStyle(
                fontSize: 40, color: Colors.blue, fontWeight: FontWeight.bold)),
      ),
    );
  }
}