import 'dart:math';
import 'package:flutter/material.dart';

class ProgressPainter extends CustomPainter {
  final double progress;

  ProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Color(0xFF424242) // Initial border color
      ..strokeWidth = 6.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double sweepAngle = 2 * pi * progress;
    Rect rect = Rect.fromCircle(
      center: Offset(size.width / 2, size.height / 2),
      radius: size.width / 5,
    );

    // Draw initial border circle
    canvas.drawCircle(rect.center, rect.width / 2, paint);

    Paint fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.blue, // Blue color fill
          Colors.blue.withOpacity(0.2), // Lighter blue for gradient effect
        ],
      ).createShader(rect)
      ..strokeWidth = 6.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Draw filled arc based on progress percentage
    canvas.drawArc(rect, -pi / 2, sweepAngle, false, fillPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
