import 'package:flutter/material.dart';

class BubbleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
        child: Text(
          "你好世界",
          style: TextStyle(
            decoration: TextDecoration.none,
//          color: Color(0x8CB4D6FF),
            color: Colors.red,
            fontSize: 10,
            fontFamily: "KaiTi",
//          height: 20,
          ),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(7.0),
        ),
        color: Colors.white,
      ),
    );
  }
}
