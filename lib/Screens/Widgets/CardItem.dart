import 'package:flutter/material.dart';

class Carditem extends StatefulWidget {
  const Carditem(
      {super.key,
      required this.hintTxt, required this. controller,
      });
      final String hintTxt;
      final TextEditingController controller;
  @override
  State<Carditem> createState() => _CarditemState();
}

class _CarditemState extends State<Carditem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        controller:widget.controller,
        style: const TextStyle(
          color: Colors.white, 
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.white,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(
              color: Colors.amber,
              width: 2,
            ),
          ),
          hintText: widget.hintTxt,
          hintStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
      ),
    );
          
  }
}
