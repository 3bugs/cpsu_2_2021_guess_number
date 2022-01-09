import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/guess_logo.png', width: 90.0),
                  SizedBox(width: 8.0),
                  Column(
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
              SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(textAlign: TextAlign.center),
              ),
              Padding(
                padding: const EdgeInsets.all(0.0),
                child: ElevatedButton(child: Text('GUESS'), onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
