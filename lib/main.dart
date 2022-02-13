import 'dart:math';

import 'package:flutter/material.dart';
import 'package:guess_number/login_page.dart';
import 'package:guess_number/test_page.dart';

import 'game.dart';

void main() {
  const app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // callback method
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
          ),
          headline6: TextStyle(
            fontSize: 22.0,
            //fontWeight: FontWeight.bold,
          ),
          bodyText2: TextStyle(
            fontSize: 14.0,
          ),
        ),
      ),
      home: LoginPage(),
    );
  }
}

class HomePage extends StatefulWidget {
  late Game _game;

  HomePage({Key? key}) : super(key: key) {
    _game = Game(maxRandom: 100);
  }

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _input = '';
  var _feedbackText = 'ทายเลข 1 ถึง 100';

  void _showOkDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GUESS THE NUMBER'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.purple.shade50,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.purple.shade100,
                offset: Offset(5.0, 5.0),
                spreadRadius: 2.0,
                blurRadius: 5.0,
              )
            ],
          ),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/guess_logo.png', width: 90.0),
                    SizedBox(width: 8.0),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('GUESS',
                            style: TextStyle(
                                fontSize: 36.0, color: Colors.purple.shade200)),
                        Text(
                          'THE NUMBER',
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.purple.shade600,
                            //fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(_input, style: TextStyle(fontSize: 50.0)),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(_feedbackText, style: TextStyle(fontSize: 20.0)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 1; i <= 3; i++) _buildButton(num: i),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 4; i <= 6; i++) _buildButton(num: i),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (var i = 7; i <= 9; i++) _buildButton(num: i),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildButton(num: -2),
                  _buildButton(num: 0),
                  _buildButton(num: -1),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: Text('GUESS'),
                  onPressed: () {
                    var guess = int.tryParse(_input);

                    if (guess == null) {
                      _showOkDialog(context, 'ERROR', 'กรุณากรอกตัวเลข');
                      return;
                    }

                    late String message;
                    var guessResult = widget._game.doGuess(guess);
                    if (guessResult > 0) {
                      setState(() {
                        _feedbackText = '$guess : มากเกินไป';
                        _input = '';
                      });
                    } else if (guessResult < 0) {
                      setState(() {
                        _feedbackText = '$guess : น้อยเกินไป';
                        _input = '';
                      });
                    } else {
                      setState(() {
                        _feedbackText =
                            '$guess : ถูกต้อง 🎉 (ทาย ${widget._game.guessCount} ครั้ง)';
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton({int? num}) {
    Widget child = Text('$num', style: TextStyle(fontSize: 20.0));
    if (num == -2) {
      child = Icon(Icons.close);
    } else if (num == -1) {
      child = Icon(Icons.backspace_outlined);
    }

    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            if (num == -2) {
              setState(() {
                _input = '';
              });
            } else if (num == -1) {
              if (_input.length > 0) {
                setState(() {
                  _input = _input.substring(0, _input.length - 1);
                });
              }
            } else {
              if (_input.length >= 3) return;

              setState(() {
                _input = '$_input$num';
              });
            }
          });
        },
        child: child,
      ),
    );
  }
}
