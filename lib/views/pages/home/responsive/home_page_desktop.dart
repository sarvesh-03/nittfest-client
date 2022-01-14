import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:nittfest/views/pages/home/widgets/baloon.dart';
import 'package:nittfest/views/pages/home/widgets/content.dart';
import 'package:nittfest/views/pages/home/widgets/footer.dart';
import 'package:nittfest/views/pages/home/widgets/giant_wheel.dart';
import 'package:nittfest/views/pages/home/widgets/spinner.dart';

class HomePageDesktop extends StatelessWidget {
  const HomePageDesktop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(children: [
      Row(children: [
        const Expanded(
            child: Center(
          child: Content(
              mainAxisAlignment: MainAxisAlignment.center,
              logoSize: 215.0,
              headerSize: 55,
              bodySize: 28.0,
              gapSize: 20,
              gapSize2: 40,
              buttonSize: 20.0),
        )),
        Expanded(
            child: Stack(children: [
          const Positioned(right: 1, top: 50, child: Baloon()),
          const Center(child: Spinner()),
        ]))
      ]),
      const Positioned(
          bottom: 7,
          left: 5,
          right: 5,
          child: Footer(
            size: 16,
          )),
    ]);
  }
}
