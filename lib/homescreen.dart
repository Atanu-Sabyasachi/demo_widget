// ignore_for_file: prefer_const_constructors

import 'package:demo_widget/login.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child:
                // Text('Atanu'),
                LogIn(
              onLoginPressed: (userEmail, userPassword) {
                print(userEmail);
                print(userPassword);
              },
            ),
          ),
        ),
      ),
    );
  }
}
