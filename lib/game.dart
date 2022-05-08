import 'dart:math';

import 'package:collision_detection_2d/box.dart';
import 'package:collision_detection_2d/player.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';

class CollisionDetectionGame extends FlameGame
    with MouseMovementDetector, HasCollisionDetection {
  static const _obstaclesRatioHorizontal = 3;
  static const _obstaclesRatioVertical = 2;

  late final Player _player;

  @override
  Future<void>? onLoad() async {
    await super.onLoad();

    final spaceX = size.x / (_obstaclesRatioHorizontal + 1);
    final spaceY = size.y / (_obstaclesRatioVertical + 1);

    final random = Random();
    for (var i = 0; i < _obstaclesRatioHorizontal; i++) {
      for (var z = 0; z < _obstaclesRatioVertical; z++) {
        final width = (15 + random.nextInt(85)).toDouble();
        final height = (15 + random.nextInt(85)).toDouble();

        final box = Box(boxWidth: width, boxHeight: height);
        add(box);
        final posX = ((i + 1) * spaceX) - (width / 2);
        final posY = ((z + 1) * spaceY) - (height / 2);
        box.position = Vector2(posX, posY);
      }
    }

    _player = Player();
    add(_player);
  }

  @override
  void onMouseMove(PointerHoverInfo info) {
    super.onMouseMove(info);
    _player.mousePosition = info.eventPosition.game;
  }
}
