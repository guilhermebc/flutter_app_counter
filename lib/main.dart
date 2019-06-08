import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      title: 'My counter App',
      home: Counter()
  ));
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {

  int _currentValue = 0;
  String _infoText = 'is empty!';

  void onChangeValue(int value) {
     setState(() {
       _currentValue += value;

       if(_currentValue > 0) {
         _infoText = 'is positive!';
       } else if(_currentValue == 0) {
         _infoText = 'is neutral!';
       } else {
         _infoText = 'is negative!';
       }
     });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          'images/background.jpg',
          fit: BoxFit.cover,
          height: 1000.0,
          filterQuality: FilterQuality.high,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Counter: $_currentValue",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child:
                  FlatButton(
                    child: Text('+', style: TextStyle(fontSize: 50.0, color: Colors.white)),
                    onPressed: () {
                      onChangeValue(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child:
                  FlatButton(
                    child: Text('-', style: TextStyle(fontSize: 50.0, color: Colors.white)),
                    onPressed: () {
                      onChangeValue(-1);
                    },
                  ),
                ),
              ],
            ),
            Text("$_infoText ",
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 30
                )
            ),

          ],
        )
      ],
    );
  }
}
