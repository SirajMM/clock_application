import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({super.key});

  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: Transform.rotate(
        angle: -pi / 2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter {
  DateTime dateTime = DateTime.now();

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;
    final radius = min(centerX, centerY);
    final center = Offset(centerX, centerY);
    final fillBrush = Paint()..color = const Color(0xFF444974);
    final outerCircleBrush = Paint()
      ..color = const Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16;
    final secondBrush = Paint()
      ..color = Colors.orange[300]!
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    final minuteBrush = Paint()
      ..shader =
          const RadialGradient(colors: [Color(0xFF748EF6), Color(0xFF77DDFF)])
              .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;
    final hourBrush = Paint()
      ..shader =
          const RadialGradient(colors: [Color(0xFFEA74AB), Color(0xFFC279FB)])
              .createShader(Rect.fromCircle(center: center, radius: radius))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 13;
    final centerCircleBrush = Paint()..color = const Color(0xFFEAECFF);
    var dashBrush = Paint()
      ..color = const Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 1;

    canvas.drawCircle(center, radius - 40, fillBrush);
    canvas.drawCircle(center, radius - 40, outerCircleBrush);
    final hourHandX = centerX +
        60 * cos((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    final hourHandy = centerX +
        60 * sin((dateTime.hour * 30 + dateTime.minute * 0.5) * pi / 180);
    canvas.drawLine(center, Offset(hourHandX, hourHandy), hourBrush);
    final minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    final minHandy = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);
    canvas.drawLine(center, Offset(minHandX, minHandy), minuteBrush);

    final secHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    final secHandy = centerX + 80 * sin(dateTime.second * 6 * pi / 180);
    canvas.drawLine(center, Offset(secHandX, secHandy), secondBrush);
    canvas.drawCircle(center, 16, centerCircleBrush);
    var outerCircleRadius = radius;
    var innerCircleRadius = radius - 14;
    for (double i = 0; i < 360; i += 12) {
      double x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      double y1 = centerX + outerCircleRadius * sin(i * pi / 180);

      double x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      double y2 = centerX + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
