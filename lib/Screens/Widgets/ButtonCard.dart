import 'package:flutter/material.dart';

class Buttoncard extends StatelessWidget {
   Buttoncard({super.key,required this.txt,required this.onclick});
  String txt;
  Function onclick;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
     onclick();

    }, child: Text(txt,style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(29, 0, 0, 255),
                  foregroundColor:(txt=='x')?Colors.red:Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                );
  }
}