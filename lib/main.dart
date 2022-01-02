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
        primarySwatch: Colors.blue,
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
      body: Container(
        // เทียบได้กับแท็ก <div> ของ HTML
        decoration: BoxDecoration(
            color: Colors.yellow,
            border: Border.all(width: 5.0, color: Colors.blue),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(2.0, 5.0),
                blurRadius: 5.0,
                spreadRadius: 2.0,
              ),
            ]),
        //alignment: Alignment.center,
        child: Center(
          child: Column(
            //mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/doraemon.png', width: 100.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hello',
                    style: TextStyle(fontSize: 30.0, color: Color(0x80FF0000)),
                  ),
                  TextButton(
                    child: Text('TEST'),
                    onPressed: () {},
                  ),
                ],
              ),
              OutlinedButton(
                child: Text('RANDOM'),
                onPressed: () {
                  // โค้ดที่จะทำงานเมื่อกดปุ่ม
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
