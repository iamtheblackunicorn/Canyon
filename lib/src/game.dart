import 'vars.dart';
import 'package:flutter/material.dart';

class Game extends CustomPainter{
  final double playerX;
  final double playerY;
  final double playerWidth;
  Game({
    @required this.playerX,
    @required this.playerY,
    @required this.playerWidth
  });
  @override
  void paint(Canvas canvas, Size size){

    // Construct terrain.
    Paint terrainPaint = new Paint();
    terrainPaint.color = Color(0xFFDF0045);

    double boxUnitHeight = size.height/6;
    double boxUnitWidth = size.width/6;

    /// [Left canyon].
    Rect canyonOneLeft = Rect.fromLTWH(
      0,
      0,
      boxUnitWidth,
      boxUnitHeight
    );
    canvas.drawRect(
      canyonOneLeft,
      terrainPaint
    );
    Rect canyonTwoLeft = Rect.fromLTWH(
      0,
      (0+boxUnitHeight),
      boxUnitWidth + ((boxUnitWidth/2) * 3),
      boxUnitHeight
    );
    canvas.drawRect(
      canyonTwoLeft,
      terrainPaint
    );
    Rect canyonThreeLeft = Rect.fromLTWH(
      0,
      ((0+boxUnitHeight)*2),
      boxUnitWidth,
      boxUnitHeight
    );
    canvas.drawRect(
      canyonThreeLeft,
      terrainPaint
    );
    Rect canyonFourLeft = Rect.fromLTWH(
      0,
      ((0+boxUnitHeight)*3),
      boxUnitWidth + ((boxUnitWidth/2) * 3),
      boxUnitHeight
    );
    canvas.drawRect(
      canyonFourLeft,
      terrainPaint
    );
    Rect canyonFiveLeft = Rect.fromLTWH(
      0,
      ((0+boxUnitHeight)*4),
      boxUnitWidth,
      boxUnitHeight
    );
    canvas.drawRect(
      canyonFiveLeft,
      terrainPaint
    );
    Rect canyonSixLeft = Rect.fromLTWH(
      0,
      ((0+boxUnitHeight)*5),
      boxUnitWidth + ((boxUnitWidth/2) * 3),
      boxUnitHeight
    );
    canvas.drawRect(
      canyonSixLeft,
      terrainPaint
    );

    /// [Right canyon].
    Rect canyonOneRight = Rect.fromLTWH(
      size.width-boxUnitWidth,
      0,
      boxUnitWidth,
      boxUnitHeight
    );
    canvas.drawRect(
      canyonOneRight,
      terrainPaint
    );
    Rect canyonTwoRight = Rect.fromLTWH(
      size.width-boxUnitWidth,
      (0+boxUnitHeight),
      boxUnitWidth,
      boxUnitHeight
    );
    canvas.drawRect(
      canyonTwoRight,
      terrainPaint
    );
    Rect canyonThreeRight = Rect.fromLTWH(
      size.width-boxUnitWidth,
      ((0+boxUnitHeight)*2),
      boxUnitWidth,
      boxUnitHeight
    );
    canvas.drawRect(
      canyonThreeRight,
      terrainPaint
    );
    Rect canyonFourRight = Rect.fromLTWH(
      size.width-boxUnitWidth,
      ((0+boxUnitHeight)*3),
      boxUnitWidth,
      boxUnitHeight
    );
    canvas.drawRect(
      canyonFourRight,
      terrainPaint
    );
    Rect canyonFiveRight = Rect.fromLTWH(
      size.width-boxUnitWidth,
      ((0+boxUnitHeight)*4),
      boxUnitWidth,
      boxUnitHeight
    );
    canvas.drawRect(
      canyonFiveRight,
      terrainPaint
    );
    Rect canyonSixRight = Rect.fromLTWH(
      size.width-boxUnitWidth,
      ((0+boxUnitHeight)*5),
      boxUnitWidth,
      boxUnitHeight
    );
    canvas.drawRect(
      canyonSixRight,
      terrainPaint
    );

    // Construct player.
    Paint playerPaint = new Paint();
    playerPaint.color = Color(0xFFFFFFFF);
    double playerDim = playerWidth;
    Rect player = Rect.fromLTWH(
      playerX,
      playerY,
      playerDim,
      playerDim
    );
    canvas.drawRect(
      player,
      playerPaint
    );

  }
  @override
  bool shouldRepaint(Game oldDelegate) => true;
}
