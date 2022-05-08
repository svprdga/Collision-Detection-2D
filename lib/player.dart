import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Player extends PositionComponent {
  static const _playerSize = 64.0;
  static const _acceleration = 300.0;

  late final Rect _rect;
  final Paint _paint = Paint()..color = Colors.greenAccent;

  Vector2 mousePosition = Vector2.zero();

  Player() {
    size = Vector2(_playerSize, _playerSize);
    _rect = Rect.fromLTWH(0, 0, width, height);
  }

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(RectangleHitbox());
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRect(_rect, _paint);
  }

  @override
  void update(double delta) {
    super.update(delta);
    final Vector2 target = mousePosition + Vector2(width / -2, height / -2);
    final Vector2 directionVector = target - position;

    if (position.distanceTo(target) > 3) {
      position =
          position + (directionVector.normalized() * delta * _acceleration);
    }
  }
}
