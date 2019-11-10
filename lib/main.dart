import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(Ticker());

class Timers extends StatelessWidget {
  final String label;
  final String value;

  Timers(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        padding: EdgeInsets.all(20),
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(10),
          color: Colors.black87,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '$value',
              style: TextStyle(
                color: Colors.white,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$label',
              style: TextStyle(color: Colors.white70),
            )
          ],
        ));
  }
}

class Ticker extends StatefulWidget {
  @override
  _TickerState createState() => _TickerState();
}

class _TickerState extends State<Ticker> {
  static const duration = const Duration(seconds: 1);

  int secondsPassed = 0;
  bool isActive = false;
  Timer timer;
  @override
  Widget build(BuildContext context) {
    if (timer == null)
      timer = Timer.periodic(duration, (Timer t) {
        handleTick();
      });

    int seconds = secondsPassed % 60;
    int minutes = secondsPassed ~/ 60;
    int hours = secondsPassed ~/ (60 * 60);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Timer'),
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: Column(

            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Timers('Hour', '$hours'),
                  Timers('Minute', '$minutes'),
                  Timers('Second', '$seconds'),

                ],
              ),
              FlatButton(
                child: Text('Hello'),
                onPressed: (){
                  setState(() {
                    isActive=!isActive;
                  });
                },
              )
            ],

          ),


        ),

      ),
    );
  }

  void handleTick() {
    if (isActive) {
      setState(() {
        secondsPassed = secondsPassed + 1;
      });
    }
  }
}
