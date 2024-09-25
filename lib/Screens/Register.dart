import 'package:flutter/material.dart';
import 'package:xo/Screens/GameBoard.dart';
import 'package:xo/Screens/Widgets/CardItem.dart';
import 'package:xo/Screens/Widgets/Data.dart';

class Register extends StatelessWidget {
  const Register({super.key});
  static const String routeName = "Register";

  @override
  Widget build(BuildContext context) {
    TextEditingController Player1Name=TextEditingController();
    TextEditingController Player2Name=TextEditingController();
    return Scaffold(
      backgroundColor: const Color(0xff271767),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Carditem(hintTxt: 'Name For Player (x)',controller:Player1Name,),
          const SizedBox(height: 60),
          Carditem(hintTxt: 'Name For Player (o)',controller:Player2Name,),
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  Gameboard.routeName,
                  arguments: Data(
                    Player1Name: Player1Name.text,
                    Player2Name: Player2Name.text,
                  ),
                );
              },
              child: Center(
                child: Text(
                  'Let\'s GO',
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff271767),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
