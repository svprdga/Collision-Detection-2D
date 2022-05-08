import 'package:collision_detection_2d/game.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flame Platformer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GameWidget(
        game: CollisionDetectionGame(),
      ),
    );
  }
}
