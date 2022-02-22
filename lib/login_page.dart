import 'package:flutter/material.dart';
import 'package:guess_number/main_page.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/login';

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const PIN = '123456';
  //static const PIN_LENGTH = 6;
  var _input = '123'; // state variable

  // single source of truth

  var _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                /*stops: [
                  0.0,
                  0.95,
                  1.0,
                ],*/
                colors: [
                  Colors.white,
                  //Color(0xFFD8D8D8),
                  //Color(0xFFAAAAAA),
                  Theme.of(context).colorScheme.background.withOpacity(0.5),
                  //Theme.of(context).colorScheme.background.withOpacity(0.6),
                  //Colors.white,
                ],
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.lock_outline,
                              size: 90.0,
                              color:
                                  Theme.of(context).textTheme.headline1?.color,
                            ),
                            Text(
                              'LOGIN',
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            SizedBox(height: 6.0),
                            Text(
                              'Enter PIN to login',
                              style: Theme.of(context).textTheme.bodyText2,
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (var i = 0; i < _input.length; i++)
                              Container(
                                margin: EdgeInsets.all(4.0),
                                width: 24.0,
                                height: 24.0,
                                decoration: BoxDecoration(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                    shape: BoxShape.circle),
                              ),
                            for (var i = _input.length; i < 6; i++)
                              Container(
                                margin: EdgeInsets.all(4.0),
                                width: 24.0,
                                height: 24.0,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                              ),
                          ],
                        )
                      ],
                    ),
                  ),
                  _buildNumPad(context),
                ],
              ),
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.5),
              child: Center(
                child: SizedBox(
                  width: 20.0,
                  height: 20.0,
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildNumPad(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          [1, 2, 3],
          [4, 5, 6],
          [7, 8, 9],
          [-2, 0, -1],
        ].map((row) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: row.map((item) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: LoginButton(
                  number: item,
                  onClick: () {
                    _handleClickButton(context, item);
                  },
                ),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }

  _handleClickButton(BuildContext context, int num) async {
    print('You pressed $num');

    if (num == -1) {
      if (_input.length > 0) {
        setState(() {
          _input = _input.substring(0, _input.length - 1);
        });
      }
    } else if (_input.length < PIN.length) {
      setState(() {
        _input = '$_input$num';
      });
    }

    if (_input.length == PIN.length) {
      if (_input == PIN) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const MainPage()),
        );
      } else {
        _showOkDialog(context, 'Incorrect PIN', 'Please try again');
        setState(() {
          _input = '';
        });
      }

      /*var isLogin = await _login(_input);

      if (isLogin == null) return;

      if (isLogin) {
        //Navigator.pushReplacementNamed(context, HomePage.routeName);
      } else {
        setState(() {
          _input = '';
        });
        _showMaterialDialog('LOGIN FAILED', 'Invalid PIN. Please try again.');
      }*/
    }
  }

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

  Future<bool?> _login(String pin) async {}
}

class LoginButton extends StatelessWidget {
  final int number;
  final Function() onClick;

  const LoginButton({
    required this.number,
    required this.onClick,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: CircleBorder(),
      onTap: number == -2 ? null : onClick,
      child: Container(
        width: 75.0,
        height: 75.0,
        decoration: number < 0
            ? null
            : BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(0.5),
                border: Border.all(
                  width: 3.0,
                  color: Theme.of(context).textTheme.headline1!.color!,
                ),
              ),
        child: Center(
          child: number >= 0
              ? Text(
                  '$number', // number.toString()
                  style: Theme.of(context).textTheme.headline6,
                )
              : (number == -1
                  ? Icon(
                      Icons.backspace_outlined,
                      size: 28.0,
                    )
                  : SizedBox.shrink()),
        ),
      ),
    );
  }
}
