import 'package:flutter/material.dart';

import 'dart:math';

class AnimatedContainerPage extends StatefulWidget {
  AnimatedContainerPage({Key key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _height = 50.0;
  Color _color = Colors.pink;
  BorderRadiusGeometry _borderRadiusGeometry = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            borderRadius: _borderRadiusGeometry,
            color: _color,
          ),
          duration: Duration(seconds: 1),
          curve: Curves.easeInOutBack, //Nos dice la animacion que usará
          //https://api.flutter.dev/flutter/animation/Curves-class.html
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_circle_outline, size: 50.0),
        onPressed: _cambiarForma,
      ),
    );
  }

  void _cambiarForma() {
    final ran = Random();

    setState(() {
      _width = ran.nextInt(300).toDouble();
      _height = ran.nextInt(300).toDouble();
      _color = Color.fromRGBO(
        ran.nextInt(256),
        ran.nextInt(256), 
        ran.nextInt(256),
        1
      );
      _borderRadiusGeometry = BorderRadius.circular(
        ran.nextInt(100).toDouble()
      );
      
    });
  }
}