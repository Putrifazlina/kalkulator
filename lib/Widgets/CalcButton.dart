import 'package:flutter/material.dart';


class CalcButton extends StatelessWidget {
   final String text;
   final int fillColor;
   final int textColor;
   final double textSize;
   final Function callback;
  const CalcButton({Key key,
    this.fillColor,
    this.text,
    this.textColor= 0xFFFFFFFF,
    this.textSize = 25,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
      margin: EdgeInsets.all(7),
      child : SizedBox(
      width:65 ,
      height: 65,
      child :FlatButton(
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    ),
      child: Text(text,
    style: TextStyle(
    fontSize: textSize,),
      ),
      onPressed: () {
        callback(text);
      },
    color: fillColor!= null ?Color(fillColor) :null,
        textColor: Color(textColor),
    ),
      ),
    );
}
}