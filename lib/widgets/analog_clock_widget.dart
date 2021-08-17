import 'dart:math';

import 'package:analog_clock/constants.dart';
import 'package:analog_clock/size_config.dart';
import 'package:analog_clock/widgets/clock_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnalogClockWidget extends StatelessWidget {
  final DateTime time;

  const AnalogClockWidget({Key key, this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(20),
          ),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 0),
                      color: kShadowColor.withOpacity(0.14),
                      blurRadius: 64)
                ],
              ),
              child: Transform.rotate(
                angle: -pi / 2,
                child: CustomPaint(
                  painter: ClockPainter(context, time),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: getProportionateScreenHeight(185),
          left: 0,
          right: 0,
          child: SvgPicture.asset(
            'assets/icons/Sun.svg',
            color: Theme.of(context).primaryColor,
          ),
        )
      ],
    );
  }
}
