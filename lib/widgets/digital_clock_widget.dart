import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DigitalClockWidget extends StatefulWidget {
  @override
  _DigitalClockWidgetState createState() => _DigitalClockWidgetState();
}

class _DigitalClockWidgetState extends State<DigitalClockWidget> {
  TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (TimeOfDay.now().minute != _timeOfDay.minute) {
        setState(() => _timeOfDay = TimeOfDay.now());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String _period = _timeOfDay.period == DayPeriod.am ? "AM" : "PM";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${_timeOfDay.hourOfPeriod.toString().padLeft(2, '0')} : ${_timeOfDay.minute.toString().padLeft(2, '0')}',
          style: Theme.of(context).textTheme.headline1,
        ),
        SizedBox(width: 5),
        RotatedBox(quarterTurns: 3, child: Text(_period)),
      ],
    );
  }
}
