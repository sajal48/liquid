import 'package:flutter/material.dart';
import 'package:liquid/widget/liquid.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Liquid(
              isFlipped: true,
              controller: _animationController,
            ),
            Text(
              'Hi Pilu',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.pinkAccent),
            ),
            Liquid(
              isFlipped: false,
              controller: _animationController,
            ),
          ],
        ),
      ),
    );
  }
}
