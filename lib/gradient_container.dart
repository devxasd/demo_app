import 'dart:math';

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
  var url = 'assets/dice-images/dice-1.png';
  var result = 0;

  void rollDice() {
    setState(
      () {
        var num = RAND.nextInt(6) + 1;

        url = 'assets/dice-images/dice-$num.png';

        result = result + num;
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
            Image.asset(
              url,
              width: 200,
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
                "Dice",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text("Result $result"),
          ],
        ),
      ),
    );
  }
}
