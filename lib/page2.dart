
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pedometer/pedometer.dart';

import 'home_page.dart';

class MyHomePage2 extends StatelessWidget  {
  MyHomePage2({Key? key}) {}
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      appBar: AppBar(),
      body:Center(child: Text("Current State is : $currentState"),),
    );
  }}

class StepCounter extends StatefulWidget {
  @override
  _StepCounterState createState() => _StepCounterState();
}

class _StepCounterState extends State<StepCounter> {
  late Stream<StepCount> _stepCountStream;
  int _stepsCount = 0;

  @override
  void initState() {
    super.initState();
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount);
  }

  void onStepCount(StepCount event) {
    setState(() {
      _stepsCount = event.steps;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Step Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Steps Taken',
              style: TextStyle(fontSize: 30),
            ),
            Text(
              '$_stepsCount',
              style: TextStyle(fontSize: 60),
            ),
          ],
        ),
      ),
    );
  }
}