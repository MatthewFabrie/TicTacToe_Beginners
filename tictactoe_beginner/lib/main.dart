import 'package:flutter/material.dart';

void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
 
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
 
class _HomePageState extends State<HomePage> {
  bool oTurn = true;
  
  List<String> displayElement = ['', '', '', '', '', '', '', '', ''];
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              // vous pouvez créer un compteur de score ici avec les variables oScore et Xscore
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            // Affichage sous format de grille 3*3 
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  // Check ou l'utilisateur à appuyé et renvoyer l'index de la case qui à été press en question
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    // contours des cases
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      // A faire: afficher les bons symboles au bon endroit en utilisant la variable displayElement (la map)
                    ),
                  );
                }),
          ),
          // Si vous avez fini, vous pouvez créer un bouton pour clear le board ici, vous pouvez vous servir de la fonction clearBoard
        ],
      ),
    );
  }
 
  void _tapped(int index) {
    setState(() {
    // changer la variable displayElement qui représente la map pour mettre un X ou un O à l'endroit ou le joueur à appuyé (servez vous de la variable Oturn pour savoir à qui est le tour)
    });
  }
 
  void _checkWinner() {
    // A faire: check toutes les conditions de win ou d'égalité, servez vous de la fonction showWinner pour afficher un pop up et affichez le gagnant, en cas d'égalité appelez showDraw
  }
 
  void showWinner(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("\" " + winner + " \" is the Winner!!!"),
            actions: [
              TextButton(
                child: Text("Play Again"),
                onPressed: () {
                  clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
 
    if (winner == 'O') {
      oScore++;
    } else if (winner == 'X') {
      xScore++;
    }
  }
 
  void showDraw() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Draw"),
            actions: [
              TextButton(
                child: Text("Play Again"),
                onPressed: () {
                  clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
 
  void clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayElement[i] = '';
      }
    });
 
    filledBoxes = 0;
  }
}