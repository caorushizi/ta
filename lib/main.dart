import 'dart:async';
import 'dart:math';

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
  final _remembranceDay = DateTime(2018, 1, 28);
  final _feedbackType = FeedbackType.heavy;
  final arr = [
    "饿的时候总想偷偷看你一眼，大概是因为秀色可餐吧。",
    "我想变得有趣，变得特别，变成你眼里的一点星光。",
    "如果可以和你在一起，我宁愿让天空所有的星光全部陨落，因为你的眼睛，是我生命里最亮的光芒。",
    "我好喜欢你，从天南到地北，从地老到天荒。",
    "有些东西，并不是越浓越好，要恰到好处。深深的话，我们浅浅地说，长长的路，我们慢慢地走。",
    "写你名字可真难，倒不是笔画繁琐，只是写你名字时地蘸上四分春风，三分月色，两分微醺，还有一分你的眉眼才好。",
    "知道我和唐僧有什么区别吗？唐僧想取经，而我想娶你！",
    "你是我最光明的秘密，也是我从不曾拥有的底气。",
    "我不要这世间的繁华，你就是我的天下。此生有你，世间再无他。",
    "你若粗茶淡饭，与我共苦同甘，我便披诚露胆，陪你海枯石烂。你若齐眉举案，给我嘘寒问暖，我便重惜轻怜，护你一世长安。",
    "我一生所见的风景，都难及你眉眼微颤的万种风情。",
  ];
  int ourTotal;

  calcDays() {
    var today = DateTime.now();
    setState(() {
      ourTotal = today.difference(_remembranceDay).inDays;
    });
  }

  @override
  Widget build(BuildContext context) {
    calcDays();
    Timer(Duration(seconds: 8), () {
      calcDays();
    });
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.gif'),
          fit: BoxFit.cover,
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
              child: Image(image: AssetImage("assets/images/5.png")),
              onTap: () {
                print(5);
                _showTip();
              },
            ),
          ),
          // 左上角第二个图标
          Positioned(
            left: 12,
            top: 150,
            child: GestureDetector(
              child: Image(image: AssetImage("assets/images/4.png")),
              onTap: () {
                print(4);
                _showTip();
              },
            ),
          ),
          // 左边第三个图标
          Positioned(
            left: 0,
            top: 397,
            child: GestureDetector(
              child: Image(image: AssetImage("assets/images/1.png")),
              onTap: () {
                print('1');
                _showTip();
              },
            ),
          ),
          // 左边第四个图标
          Positioned(
            top: 472,
            left: 0,
            child: GestureDetector(
              child: Image(image: AssetImage("assets/images/6.png")),
              onTap: () {
                print(6);
                _showTip();
              },
            ),
          ),
          // 右边第一个图标
          Positioned(
            top: 157,
            right: 0,
            child: GestureDetector(
              child: Image(image: AssetImage("assets/images/3.png")),
              onTap: () {
                print(3);
                _showTip();
              },
            ),
          ),
          // 右边第二个图标
          Positioned(
            top: 284,
            right: 32,
            child: GestureDetector(
              child: Image(image: AssetImage("assets/images/2.png")),
              onTap: () {
                print(2);
                _showTip();
              },
            ),
          ),
          // 右下角礼物图标
          Positioned(
            right: 15,
            bottom: 15,
            child: GestureDetector(
              child: Image(
                image: AssetImage("assets/images/gift.png"),
                fit: BoxFit.cover,
                width: 30,
                height: 30,
              ),
              onTap: () {
                print('gift');
                _showTip();
              },
            ),
          ),
          Positioned(
            top: 120,
            child: _buildBrand(),
          ),
          Positioned(
            top: 70,
            child: Text(
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

  _showTip() {
    var s = arr[Random().nextInt(arr.length)];
    // 手机震动提示
    Vibrate.feedback(_feedbackType);
    Toast.toast(context, s);
  }

  _buildBrand() {
    return Container(
      width: 294,
      height: 64,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            child: Image(
              image: AssetImage("assets/images/brandBg.png"),
              fit: BoxFit.cover,
              width: 294,
              height: 64,
            ),
          ),
          Positioned(
            top: 6,
            left: 182,
            child: Container(
              width: 56,
              height: 58,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/circle.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  "$ourTotal",
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Color.fromARGB(255, 255, 165, 165),
                    fontSize: 23,
                    fontFamily: "KaiTi",
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Positioned(
            top: 23,
            left: 62,
            child: Text(
              "今天已经相恋",
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 20,
                fontFamily: "KaiTi",
              ),
            ),
          ),
          Positioned(
            top: 23,
            right: 5,
            child: Text(
              "天啦!",
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
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
