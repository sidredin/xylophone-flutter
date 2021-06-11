import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  final player = AudioCache();
  final List<XylophoneButtonsData> xylophoneButtonsData = [
    XylophoneButtonsData(Colors.red, 1),
    XylophoneButtonsData(Colors.orange, 2),
    XylophoneButtonsData(Colors.yellow, 3),
    XylophoneButtonsData(Colors.green, 4),
    XylophoneButtonsData(Colors.blue[200], 5),
    XylophoneButtonsData(Colors.blue[900], 6),
    XylophoneButtonsData(Colors.purple, 7),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: xylophoneButtonsData
                .map(
                  (e) => XylophoneButton(
                      color: e.color, noteNumber: e.noteNumber, player: player),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}

class XylophoneButtonsData {
  final Color color;
  final int noteNumber;

  XylophoneButtonsData(this.color, this.noteNumber);
}

class XylophoneButton extends StatelessWidget {
  final Color color;
  final int noteNumber;
  final AudioCache player;

  const XylophoneButton({Key key, this.color, this.noteNumber, this.player})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Container(
          color: color,
        ),
        onPressed: () {
          player.play('note$noteNumber.wav');
        },
      ),
    );
  }
}
