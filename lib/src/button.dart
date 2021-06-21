import 'vars.dart';
import 'package:flutter/material.dart';

class GamePad extends StatelessWidget{
  final IconData buttonLabel;
  final Function triggerFunction;
  GamePad({
    @required this.buttonLabel,
    @required this.triggerFunction
  });
  @override
  Widget build(BuildContext context){
    return new Expanded(
      flex: usefulFlex,
      child:new RaisedButton(
        padding: EdgeInsets.all(10),
        color: borderColor,
        shape: CircleBorder(),
        child:new Icon(
          buttonLabel,
          color: textColor,
          size: 30,
        ),
        onPressed: triggerFunction
      )
    );
  }
}
