import 'dart:ui';
import 'vars.dart';
import 'game.dart';
import 'button.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PathFinder extends StatefulWidget {
  PathFinderState createState() => PathFinderState();
}
class PathFinderState extends State<PathFinder> {
  double playerX;
  double playerY;
  String gameStatus;
  double playerWidth;
  VideoPlayerController audioPlayer;
  Future<void> audioPlayerInit;
  @override
  void initState(){
    // Game sound.
    audioPlayer = VideoPlayerController.network(
      soundTrackUrl,
    );
    audioPlayerInit = audioPlayer.initialize();
    audioPlayer.play();

    // Override the default method.
    super.initState();

    // Stateful player variables.
    playerWidth = 40;
    playerX = 0 + (2 * (window.physicalSize.width/12));
    playerY = 0;

    // Stateful info text!
    gameStatus = startingText;
  }
  @override
  void dispose(){
    audioPlayer.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appBackground,
      body: new Center(
        child: new Column(
          children: <Widget> [
            new SizedBox(
              height: stdPadding
            ),
            new Padding(
              padding: EdgeInsets.all(stdPadding),
              child: new Container(
                decoration: BoxDecoration(
                  color: textColor,
                  border: Border.all(
                    width: borderWidth,
                    color: borderColor,
                  )
                ),
                height: screenHeight/3,
                width: screenWidth,
                child: new CustomPaint(
                  painter: new Game(
                    playerX: playerX,
                    playerY: playerY,
                    playerWidth: playerWidth
                  )
                )
              )
            ),
            new SizedBox(
              height: 30
            ),
            new Padding(
              padding: EdgeInsets.all(stdPadding),
              child: new Text(
                '$gameStatus',
                textAlign: TextAlign.center,
                style: new TextStyle(
                  color: borderColor,
                  fontSize: 25,
                  fontFamily: defaultFont
                )
              )
            ),
            new Padding(
              padding: EdgeInsets.all(stdPadding),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  new GamePad(
                    buttonLabel: right,
                    triggerFunction: () {
                      setState((){
                        playerX = playerX - 1;
                      });
                    }
                  ),
                  new GamePad(
                    buttonLabel: left,
                    triggerFunction: () {
                      setState((){
                        playerX = playerX + 1;
                      });
                    }
                  ),
                  new GamePad(
                    buttonLabel: up,
                    triggerFunction: () {
                      setState((){
                        if (playerY == 0){
                          playerY = playerY + 1;
                        }
                        else {
                          if (playerY == (3.0 * (window.physicalSize.width/12))){
                            gameStatus = endingText;
                          }
                          else {
                            playerY = playerY - 1;
                          }
                        }
                      });
                    }
                  ),
                  new GamePad(
                    buttonLabel: down,
                    triggerFunction: () {
                      setState((){
                        if (playerY == (3.0 * (window.physicalSize.width/12))){
                          gameStatus = endingText;
                        }
                        else {
                          playerY = playerY + 1;
                        }
                      });
                    }
                  ),
                  new GamePad(
                    buttonLabel: increase,
                    triggerFunction: () {
                      setState((){
                        playerWidth = playerWidth + 1;
                      });
                    }
                  ),
                  new GamePad(
                    buttonLabel: decrease,
                    triggerFunction: () {
                      setState((){
                        playerWidth = playerWidth - 5;
                      });
                    }
                  ),
                ]
              )
            ),
            new SizedBox(
              height: stdPadding
            )
          ]
        )
      )
    );
  }
}
