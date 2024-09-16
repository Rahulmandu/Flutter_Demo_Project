import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const int days = 30;
    const String authorName = "Rahul Mondal";

    return Scaffold(
      appBar: AppBar(
        title: const Text("Catalog App"),
      ),
      body: const Center(
        child: Text(
          "Welcome to $days days of Flutter by $authorName",
          style: TextStyle(fontSize: 18),
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
