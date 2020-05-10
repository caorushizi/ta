import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:loveu/bubble.dart';

void main() {
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage() : super();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final _remembranceDay = new DateTime(2018, 1, 28);
  int ourTotal;

  calcDays() {
    var today = new DateTime.now();
    setState(() {
      ourTotal = today.difference(_remembranceDay).inDays;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _feedbackType = FeedbackType.light;
    calcDays();
    Timer(Duration(seconds: 5), () {
      calcDays();
    });
    return new DecoratedBox(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage('assets/images/background.gif'),
        ),
      ),
      child: Stack(
        overflow: Overflow.clip,
        fit: StackFit.loose,
        alignment: Alignment.center,
        children: [
          // 左上角第一个图标
          Positioned(
            left: 11,
            top: 72,
            child: GestureDetector(
              child: new Image(image: new AssetImage("assets/images/5.png")),
              onTap: () {
                print(5);
                Vibrate.feedback(_feedbackType);
              },
            ),
          ),
          // 左上角第二个图标
          Positioned(
            left: 12,
            top: 150,
            child: GestureDetector(
              child: new Image(image: new AssetImage("assets/images/4.png")),
              onTap: () {
                print(4);
                Vibrate.feedback(_feedbackType);
              },
            ),
          ),
          // 左边第三个图标
          Positioned(
            left: 0,
            top: 397,
            child: GestureDetector(
              child: new Image(image: new AssetImage("assets/images/1.png")),
              onTap: () {
                print('1');
                Vibrate.feedback(_feedbackType);
              },
            ),
          ),
          // 左边第四个图标
          Positioned(
            top: 472,
            left: 0,
            child: GestureDetector(
              child: new Image(image: new AssetImage("assets/images/6.png")),
              onTap: () {
                print(6);
                Vibrate.feedback(_feedbackType);
              },
            ),
          ),
          // 右边第一个图标
          Positioned(
            top: 157,
            right: 0,
            child: GestureDetector(
              child: new Image(image: new AssetImage("assets/images/3.png")),
              onTap: () {
                print(3);
                Vibrate.feedback(_feedbackType);
              },
            ),
          ),
          // 右边第二个图标
          Positioned(
            top: 284,
            right: 32,
            child: GestureDetector(
              child: new Image(image: new AssetImage("assets/images/2.png")),
              onTap: () {
                print(2);
                Vibrate.feedback(_feedbackType);
              },
            ),
          ),
          // 右下角礼物图标
          Positioned(
            right: 15,
            bottom: 15,
            child: GestureDetector(
              child: new Image(
                image: new AssetImage("assets/images/gift.png"),
                fit: BoxFit.cover,
                width: 50,
                height: 50,
              ),
              onTap: () {
                print('gift');
                Vibrate.feedback(_feedbackType);
              },
            ),
          ),
          Positioned(
            top: 100,
            child: BubbleWidget(),
          ),
          Positioned(
            top: 145,
            child: new Text(
              "今天已经相恋 $ourTotal 天啦!",
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 20,
                fontFamily: "KaiTi",
              ),
            ),
          ),
          Positioned(
            top: 70,
            child: new Text(
              "豆豆和莎莎",
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Color(0xff4188C8),
                fontSize: 20,
                fontFamily: "KaiTi",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
