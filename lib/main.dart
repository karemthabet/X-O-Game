import 'package:flutter/material.dart';
import 'package:xo/Screens/GameBoard.dart';
import 'package:xo/Screens/HomeScreen.dart';
import 'package:xo/Screens/Register.dart';

void main(){
  runApp( const XO_Game());
}
class  XO_Game extends StatelessWidget {
  const  XO_Game({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: { 
      Homescreen.routeName:(context)=>Homescreen(),
      Register.routeName:(context)=>Register(),
      Gameboard.routeName:(context)=>Gameboard(), 
      },initialRoute: Homescreen.routeName,

    );
  }
}