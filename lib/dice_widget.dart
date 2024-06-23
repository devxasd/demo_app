import 'package:flutter/material.dart';

class DiceWidget extends StatelessWidget {
  final dynamic url;
  const DiceWidget({super.key,this.url});

  @override
  Widget build(context) {
    return Image.asset(
      url,
      width: 200,
      
    );
  }
}
