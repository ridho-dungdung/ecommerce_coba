import 'dart:ui';

import 'package:ecommerce_coba/app_properties.dart';
import 'package:flutter/material.dart';

class MainBackground extends CustomPainter {
  MainBackground();

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawColor(Colors.amber.shade200, BlendMode.color);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
