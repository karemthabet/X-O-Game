import 'package:flutter/material.dart';
import 'package:xo/Screens/Register.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});
  static const String routeName = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff271767),
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Center(
            child: Text(
              'Tic Tac Toe',
              style: TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(height: 80),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, Register.routeName);
              },
              child: Text(
                'GO to the Game',
                style: TextStyle(fontSize: 30,color: Colors.yellow),
              ),)
        ]));
  }
}
