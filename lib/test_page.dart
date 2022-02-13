import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({Key? key}) : super(key: key);

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  var _num = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('TEST PAGE')),
      body: SizedBox.expand(
        //width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Collection if
            if (_num > 5) Text('Hello from collection-if'),

            // Conditional expression using conditional operator (?:)
            _num > 5
                ? Text('Hello from conditional expression')
                : SizedBox.shrink(),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Collection for
                for (var i = 0; i < _num; i++)
                  Container(
                    width: 20.0,
                    height: 20.0,
                    margin: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _num++;
                    });
                  },
                  child: Text('TEST')),
            ),
          ],
        ),
      ),
    );
  }
}
