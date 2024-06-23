import 'dart:math';

import 'package:demo_app/dice_widget.dart';
import 'package:flutter/material.dart';

var RAND = Random();

class GradientContainer extends StatefulWidget {
  const GradientContainer({super.key});

  @override
  State<StatefulWidget> createState() {
    return _GradientContainerState();
  }
}

class _GradientContainerState extends State<StatefulWidget> {
  var url1 = 'assets/dice-images/dice-1.png';
  var url2 = 'assets/dice-images/dice-1.png';
  var result = "";

  var failCounter = 0;
  var msgColor = Colors.green;

  void rollDice() {
    setState(
      () {
        var num1 = RAND.nextInt(6) + 1;

        url1 = 'assets/dice-images/dice-$num1.png';

        var num2 = RAND.nextInt(6) + 1;
        url2 = 'assets/dice-images/dice-$num2.png';

        if (num1 == 6 && num2 == 6) {
          msgColor = Colors.green;
          result = "Wooho You Diced double Six";
          failCounter = 0;
        } else {
          msgColor = Colors.red;
          failCounter++;
          result = "Try again $failCounter";
        }
      },
    );
  }

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF0D41E1),
            Color(0xFF07C8F9),
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DiceWidget(
                  url: url1,
                ),
                DiceWidget(
                  url: url2,
                ),
              ],
            ),
            TextButton(
              onPressed: rollDice,
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.all(20),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      5,
                    ),
                  ),
                ),
              ),
              child: const Text(
                "Roll",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              result,
              style: TextStyle(
                backgroundColor: msgColor,
                color: Colors.white,
                fontSize: 26,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
