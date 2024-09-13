import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../utils/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  String username = '';

  // Variable to handle animation and login status
  bool _isButtonTapped = false;
  bool _isLoginSuccessful = false; // New variable to track login success

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(() {
      setState(() {
        username = _usernameController.text;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Image.asset(
            'assets/images/login_image.png',
            fit: BoxFit.contain,
            width: double.infinity, // To make the image take the full width of the screen
            height: 300, // You can adjust this height as needed
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Welcome ${username.isEmpty ? '' : username}!", // Shows 'Welcome' + username
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Column(
              children: [
                // Username input field
                TextFormField(
                  controller: _usernameController, // Attach the controller to the input field
                  decoration: const InputDecoration(
                    hintText: "Enter User Name",
                    labelText: "User Name",
                  ),
                ),
                // Password input field
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Enter Password",
                    labelText: "Password",
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AnimatedContainer(
                  duration: const Duration(seconds: 1), // Duration for animation
                  width: _isButtonTapped ? 50 : 150, // Change width on button press
                  height: 50,
                  decoration: BoxDecoration(
                    color: _isLoginSuccessful
                        ? Colors.green // Green background on login success
                        : Colors.deepPurple,
                    borderRadius: BorderRadius.circular(_isButtonTapped ? 50 : 30),
                  ),
                  child: _isLoginSuccessful
                      ? const Icon(
                    Icons.check, // Green check mark icon
                    color: Colors.white,
                    size: 32,
                  )
                      : ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        _isButtonTapped = true;
                      });

                      // Simulate login delay
                      await Future.delayed(const Duration(seconds: 1));

                      if (mounted) {
                        // Assume login is always successful for this example
                        setState(() {
                          _isLoginSuccessful = true; // Set login as successful
                        });

                        // Wait a bit before navigating to the home page
                        await Future.delayed(const Duration(seconds: 1));

                        if (mounted) {
                          Navigator.pushNamed(context, MyRoutes.homeRoute);
                        }
                      }

                      setState(() {
                        _isButtonTapped = false; // Reset button state
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      backgroundColor: Colors.transparent, // Make ElevatedButton background transparent
                      shadowColor: Colors.transparent, // Remove shadow
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
