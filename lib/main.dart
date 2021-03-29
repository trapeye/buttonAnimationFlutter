import 'package:flutter/material.dart';

import 'ButtonAnimation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ButtonState buttonState = ButtonState.idle;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: ButtonAnimation(
            widget: Text(
              'Login',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: () async {
              setState(() {
                if (buttonState == ButtonState.idle) {
                  buttonState = ButtonState.loading;
                  Future.delayed(const Duration(milliseconds: 3000), () {
                    setState(() {
                      buttonState = ButtonState.fail;
                      Future.delayed(const Duration(milliseconds: 1000), () {
                        setState(() {
                          buttonState = ButtonState.idle;
                        });
                      });
                    });
                  });
                } else {
                  buttonState = ButtonState.idle;
                }
              });
            },
            buttonState: buttonState,
            radius: 70.0,
            width: 200.0,
            color: Colors.deepPurpleAccent.shade400,
          ),
        ),
      ),
    );
  }
}
