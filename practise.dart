import 'package:flutter/material.dart';

void main() => runApp(RockPaperScissors());

class RockPaperScissors extends StatefulWidget {
  @override
  _RockPaperScissorsState createState() => _RockPaperScissorsState();
}

class _RockPaperScissorsState extends State<RockPaperScissors> {
  String _result = "";
  String _playerChoice = "";
  String _computerChoice = "";
  final _choices = ["rock", "paper", "scissors"];

  void _playGame(String playerChoice) {
    setState(() {
      _playerChoice = playerChoice;
      _computerChoice = _choices[new math.Random().nextInt(_choices.length)];
      if (_playerChoice == _computerChoice) {
        _result = "It's a tie!";
      } else if (_playerChoice == "rock" && _computerChoice == "scissors" ||
          _playerChoice == "paper" && _computerChoice == "rock" ||
          _playerChoice == "scissors" && _computerChoice == "paper") {
        _result = "You win!";
      } else {
        _result = "You lose!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Rock, Paper, Scissors"),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20),
              child: Text("You chose $_playerChoice"),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text("Computer chose $_computerChoice"),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Text(_result, style: TextStyle(fontSize: 20)),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () {
                      _playGame("rock");
                    },
                    child: Text("Rock"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      _playGame("paper");
                    },
                    child: Text("Paper"),
                  ),
                  RaisedButton(
                    onPressed: () {
                      _playGame("scissors");
                    },
                    child: Text("Scissors"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}