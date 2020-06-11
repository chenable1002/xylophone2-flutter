import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade500,
        body: SafeArea(child: KeysPage()),
      ),
    );
  }
}

class KeysPage extends StatelessWidget {
  void playSound(int noteNumber) {
    final player = new AudioCache();
    player.play('note$noteNumber.wav');
  }

  Expanded getButton(Color color, int noteNumber, double width) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 8, bottom: 8),
        width: width,
        child: FlatButton(
          shape: StadiumBorder(),
          color: color,
          onPressed: () {
            playSound(noteNumber);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 5,
              ),
              Text('note$noteNumber'),
              CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        children: <Widget>[
          getButton(Colors.red, 1, screenWidth * 0.9),
          getButton(Colors.orange, 2, screenWidth * 0.85),
          getButton(Colors.yellow, 3, screenWidth * 0.8),
          getButton(Colors.green, 4, screenWidth * 0.75),
          getButton(Colors.teal, 5, screenWidth * 0.7),
          getButton(Colors.blue, 6, screenWidth * 0.65),
          getButton(Colors.purple, 7, screenWidth * 0.6),
        ],
      ),
    );
  }
}
