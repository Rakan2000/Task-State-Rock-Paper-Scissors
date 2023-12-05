import 'package:flutter/material.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String RandomHand1 = "paper.png";
  String RandomHand2 = "rock.png";
  String whoWon = "";
  void rockPapperScissors() {
    List<String> hand1 = ["paper.png", "rock.png", "scissors.png"];
    List<String> hand2 = ["paper.png", "rock.png", "scissors.png"];
    String random1 = (hand1..shuffle()).first;
    String random2 = (hand2..shuffle()).first;

    if (random1 == "paper.png" && random2 == "rock.png") {
      whoWon = "Player 1 Won";
    } else if (random1 == "scissors.png" && random2 == "paper.png") {
      whoWon = "Player 1 Won";
    } else if (random1 == "rock.png" && random2 == "scissors.png") {
      whoWon = "Player 1 Won";
    } else if (random1 == random2) {
      whoWon = "Tie";
    } else {
      whoWon = "Player 2 Won";
    }

    setState(() {
      RandomHand1 = random1;
      RandomHand2 = random2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white10,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Rock Paper Scissors",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 172, 7),
        ),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(children: [
                  Image.asset(
                    "assets/images/$RandomHand1",
                    height: 150,
                    width: 150,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  const Text(
                    "Player 1",
                    style: TextStyle(fontSize: 18),
                  )
                ]),
                Column(children: [
                  Image.asset(
                    "assets/images/$RandomHand2",
                    height: 150,
                    width: 150,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  const Text("Player 2", style: TextStyle(fontSize: 18))
                ])
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  rockPapperScissors();
                },
                child: Text("Play", style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                    fixedSize: Size(110, 50),
                    backgroundColor: const Color.fromARGB(255, 255, 225, 0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2)))),
            Text(
              "$whoWon",
              style: TextStyle(fontSize: 30),
            ),

            // SizedBox(width: double.infinity),
          ],
        )),
      ),
    );
  }
}
