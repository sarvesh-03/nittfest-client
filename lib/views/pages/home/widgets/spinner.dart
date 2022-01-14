import 'dart:math';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:nittfest/controllers/home_controller.dart';

class Spinner extends StatelessWidget {
  const Spinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height / 2.5,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.blueGrey.withOpacity(0.125),
              spreadRadius: 75,
              blurStyle: BlurStyle.outer,
              offset: const Offset(0, 50))
        ], shape: BoxShape.circle),
        child: CustomPaint(child: Container(), painter: Wheel()));
  }
}

class Wheel extends CustomPainter {
  var controller = Get.find<HomeController>();
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 1.5);
    final radius = size.width / 1.8;
    final rect = Rect.fromCenter(center: center, width: radius, height: radius);
    var startAngle = 2.0;

    final outlinePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8
      ..color = Colors.yellow.shade800;

    final linePaint2 = Paint()
      ..style = PaintingStyle.fill
      ..strokeWidth = 10
      ..shader = ui.Gradient.radial(
        center,
        10,
        [
          Colors.amber,
          Colors.yellow.shade800,
        ],
      );

    final linePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 16
      ..shader = ui.Gradient.radial(
        center,
        500,
        [
          Colors.amberAccent.shade400,
          Colors.yellow.shade700,
        ],
      )
      ..strokeCap = StrokeCap.round;

    for (var d in controller.data) {
      const sweepAngle = (1 / 6) * 360.0 * pi / 180.0;

      final paint = Paint()
        ..style = PaintingStyle.fill
        ..color = d.color;
      canvas.drawArc(rect, startAngle, sweepAngle, true, paint);

      // final dx2 = (radius) / 2 * cos(startAngle) + 0.010;
      // final dy2 = (radius) / 2 * sin(startAngle) + 0.010;
      // final p22 = center + Offset(dx2, dy2);
      // canvas.drawLine(center, p22, outlinePaint);
      // final dx3 = (radius) / 2 * cos(startAngle) - 0.010;
      // final dy3 = (radius) / 2 * sin(startAngle) - 0.010;
      // final p23 = center + Offset(dx3, dy3);
      // canvas.drawLine(center, p23, outlinePaint);
      final dx = radius / 2 * cos(startAngle);
      final dy = radius / 2 * sin(startAngle);
      final p2 = center + Offset(dx, dy);

      canvas.drawLine(center, p2, linePaint2);
      drawLabels(canvas, center, radius, startAngle, sweepAngle, d.name!);
      startAngle += sweepAngle;
    }
    final paint2 = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.amber;
    canvas.drawCircle(center, size.width / 11, paint2);
    canvas.drawCircle(center, size.width / 13, outlinePaint);

    canvas.drawCircle(center, size.width / 9.8, outlinePaint);
    canvas.drawCircle(center, size.width / 11, linePaint);
    canvas.drawCircle(center, size.width / 3.435, outlinePaint);
    canvas.drawCircle(center, size.width / 3.785, outlinePaint);

    canvas.drawCircle(center, size.width / 3.6, linePaint);
  }

  TextPainter measureText(
      String s, TextStyle style, double maxWidth, TextAlign align) {
    final span = TextSpan(text: s, style: style);
    final tp = TextPainter(
        text: span, textAlign: align, textDirection: TextDirection.ltr);
    tp.layout(minWidth: 0, maxWidth: maxWidth);
    return tp;
  }

  Size drawTextCentered(Canvas canvas, Offset position, String text,
      TextStyle style, double maxWidth) {
    final tp = measureText(text, style, maxWidth, TextAlign.center);
    final pos = position + Offset(-tp.width / 2, -tp.height / 2);

    tp.paint(canvas, pos);
    return tp.size;
  }

  void drawLabels(Canvas canvas, Offset c, double radius, double startAngle,
      double sweepAngle, String label) {
    double r = radius * 0.32;
    final dx = r * cos(startAngle + sweepAngle / 2.0);
    final dy = r * sin(startAngle + sweepAngle / 2.0);
    final pos = c + Offset(dx, dy);
    drawTextCentered(
        canvas,
        pos,
        label,
        const TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
        100);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
