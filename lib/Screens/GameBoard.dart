import 'package:flutter/material.dart';
import 'package:xo/Screens/Widgets/ButtonCard.dart';
import 'package:xo/Screens/Widgets/Data.dart';

class Gameboard extends StatefulWidget {
  const Gameboard({super.key});
  static const String routeName = " GameBoard";

  @override
  State<Gameboard> createState() => _GameboardState();
}

class _GameboardState extends State<Gameboard> {
  
  List<String> labels = List.filled(9, '');
  int gameround = 1;
  int Player1score = 0;
  int Player2score = 0;
  String winnerMessage = ''; // لإظهار رسالة الفائز

  @override
  Widget build(BuildContext context) {
    Data data = ModalRoute.of(context)!.settings.arguments as Data;
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xff271767),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    data.Player1Name,
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    data.Player2Name,
                    style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "$Player1score",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "$Player2score",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
              child: GridView.builder(
                  itemCount: labels.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 9,
                    mainAxisExtent: 95,
                    mainAxisSpacing: 9,
                  ),
                  itemBuilder: (context, index) {
                    return Buttoncard(
                      txt: labels[index],
                      onclick: () => OnDigitClick(index, data),
                    );
                  }),
            ),
          ),
          // لإظهار الفائز أو التعادل
          Expanded(
            flex: 10,
            child: Text(
              winnerMessage,
              style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ));
  }

  OnDigitClick(int index, Data data) {
    if (labels[index].isEmpty) {
      setState(() {
        if (gameround < 9) {
          if (gameround % 2 == 0) {
            labels[index] = 'o';
            if (CheckWinner(labels[index])) {
              Player2score++;
ResetBoard();

              if(Player2score==3)
              {
 winnerMessage = "${data.Player2Name} wins!";
              ShowWinnerDialog(data.Player2Name);
              ResetBoard();
              }
             
            }
          } else {
            labels[index] = 'x';
            if (CheckWinner(labels[index])) {
              Player1score++;
              ResetBoard();

              if(Player1score==3)
              {
 winnerMessage = "${data.Player1Name} wins!";
              ShowWinnerDialog(data.Player1Name);
              ResetBoard();
              }
             
            }
          }
          gameround++;
        } else {
          winnerMessage = "It's a draw!";
          ResetBoard();
        }
      });
    }
  }

  void ShowWinnerDialog(String winnerName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          
          title: Text("We have a winner!"),
          content: Text("$winnerName wins the game!"),
          actions: [
            TextButton(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
                ResetGame();
              },
            ),
          ],
        );
      },
    );
  }

  void ResetGame() {
    Player1score = 0;
    Player2score = 0;
    ResetBoard();
  }

  bool CheckWinner(String symbol) {
    return (symbol == labels[0] && symbol == labels[1] && symbol == labels[2]) ||
           (symbol == labels[3] && symbol == labels[4] && symbol == labels[5]) ||
           (symbol == labels[6] && symbol == labels[7] && symbol == labels[8]) ||
           (symbol == labels[0] && symbol == labels[3] && symbol == labels[6]) ||
           (symbol == labels[1] && symbol == labels[4] && symbol == labels[7]) ||
           (symbol == labels[2] && symbol == labels[5] && symbol == labels[8]) ||
           (symbol == labels[0] && symbol == labels[4] && symbol == labels[8]) ||
           (symbol == labels[6] && symbol == labels[4] && symbol == labels[2]);
  }

  void ResetBoard() {
    labels = List.filled(9, '');
    gameround = 1;
    winnerMessage = ''; // إعادة تعيين رسالة الفائز
  }
}
