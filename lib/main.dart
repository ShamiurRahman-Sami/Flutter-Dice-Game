import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MyApp()
);


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme : ThemeData(
          primarySwatch: Colors.blue

        ),
      home: Dicegame(),
    );
  }
}

class Dicegame extends StatefulWidget {
  @override
  _DicegameState createState() => _DicegameState();
}

class _DicegameState extends State<Dicegame> {
  final random = Random.secure();
  var index = 0;
  var index1 = 0;
  var result = 0;
  var total =0;
  var high =0;
  final dices = [
    'images/d1.png',
    'images/d2.png',
    'images/d3.png',
    'images/d4.png',
    'images/d5.png',
    'images/d6.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xFF696D77), Color(0xFF292C36)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.clamp)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text('Dice Game'),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset(dices[index1], width: 100, height: 100, fit: BoxFit.cover,),
                    Image.asset(dices[index], width: 100, height: 100, fit: BoxFit.cover,),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                    child: Text('Roll'),
                  onPressed: (){
                    setState(() {
                      index = random.nextInt(6);
                      index1 = random.nextInt(6);
                      result = index + index1+2;
                      total = total + result;
                      print(result);
                      if ( result == 12){
                        total = 0;
                      }
                      if (high < total){
                        high = total;
                      }
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 100.0,),
                Text("Score of this Round =" + result.toString(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Total Score =" + total.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("High Score =" + high.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    )),
              ],
            ),
          ],
        ),
      ),
      ),
    );

  }
}
