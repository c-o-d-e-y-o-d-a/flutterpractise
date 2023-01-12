import 'package:flutter/material.dart';

void main() => runApp(TicTacToe());

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<List<String>> _grid = [
    ["", "", ""],
    ["", "", ""],
    ["", "", ""],
  ];
  String _currentPlayer = "X";
  String _result = "";

  void _play(int row, int col) {
    setState(() {
      if (_grid[row][col] == "") {
        _grid[row][col] = _currentPlayer;
        _checkWin();
        _currentPlayer = _currentPlayer == "X" ? "O" : "X";
      }
    });
  }

  void _checkWin() {
    for (int i = 0; i < 3; i++) {
      if (_grid[i][0] == _grid[i][1] &&
          _grid[i][1] == _grid[i][2] &&
          _grid[i][0] != "") {
        _result = _grid[i][0] + " wins!";
        return;
      }
      if (_grid[0][i] == _grid[1][i] &&
          _grid[1][i] == _grid[2][i] &&
          _grid[0][i] != "") {
        _result = _grid[0][i] + " wins!";
        return;
      }
    }
    if (_grid[0][0] == _grid[1][1] &&
        _grid[1][1] == _grid[2][2] &&
        _grid[0][0] != "") {
      _result = _grid[0][0] + " wins!";
      return;
    }
    if (_grid[0][2] == _grid[1][1] &&
        _grid[1][1] == _grid[2][0] &&
        _grid[0][2] != "") {
      _result = _grid[0][2] + " wins!";
      return;
    }
    if (_grid.expand((i) => i).every((e) => e != "")) {
      _result = "It's a tie!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Tic Tac Toe"),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 9,
                itemBuilder: (context, index) {
                  int row = index ~/ 3;
                  int col = index % 3;
                  int col = index % 3;
return GestureDetector(
onTap: () {
_play(row, col);
},
child: Container(
decoration: BoxDecoration(
border: Border.all(
color: Colors.black,
width: 1,
),
),
child: Center(
child: Text(
_grid[row][col],
style: TextStyle(
fontSize: 60,
fontWeight: FontWeight.bold,
),
),
),
),
);
},
),
),
Padding(
padding: EdgeInsets.all(20),
child: Text(_result,
style: TextStyle(
fontSize: 20,
color: _result.contains("wins")
? Colors.green
: _result.contains("tie")
? Colors.orange
: Colors.red)),
),
Padding(
padding: EdgeInsets.all(20),
child: FlatButton(
onPressed: () {
setState(() {
_grid = [
["", "", ""],
["", "", ""],
["", "", ""],
];
_result = "";
_currentPlayer = "X";
});
},
child: Text("Reset"),
),
),
],
),
),
);
}
}

