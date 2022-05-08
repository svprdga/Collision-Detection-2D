import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class Box extends PositionComponent {
  late final Rect _rect;
  final Paint _paint = Paint()..color = Colors.white;

  Box({required double boxWidth, required double boxHeight}) {
    size = Vector2(boxWidth, boxHeight);
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
}
