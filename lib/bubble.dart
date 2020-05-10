import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Toast {
  static OverlayEntry _overlayEntry; // toast靠它加到屏幕上
  static bool _showing = false; // toast是否正在showing
  static DateTime _startedTime; // 开启一个新toast的当前时间，用于对比是否已经展示了足够时间
  static String _text; // 提示内容

  static void toast(BuildContext context, String text) async {
    _text = text;
    _startedTime = DateTime.now();
    //获取OverlayState
    OverlayState overlayState = Overlay.of(context);
    _showing = true;
    if (_overlayEntry == null) {
      _overlayEntry = OverlayEntry(
        builder: (BuildContext context) => Positioned(
          top: 300,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width - 100,
            margin: EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: AnimatedOpacity(
              opacity: _showing ? 1.0 : 0.0, //目标透明度
              duration: Duration(milliseconds: 400),
              child: _buildToastWidget(),
            ),
          ),
        ),
      );
      overlayState.insert(_overlayEntry);
    } else {
      //重新绘制UI，类似setState
      _overlayEntry.markNeedsBuild();
    }

    await Future.delayed(Duration(milliseconds: 2000)); // 等待时间
    //2秒后 到底消失不消失
    if (DateTime.now().difference(_startedTime).inMilliseconds >= 2000) {
      _showing = false;
      _overlayEntry.markNeedsBuild();
      await Future.delayed(Duration(milliseconds: 400));
      _overlayEntry.remove();
      _overlayEntry = null;
    }
  }

  //toast绘制
  static _buildToastWidget() {
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
        child: Text(
          _text,
          style: TextStyle(
            decoration: TextDecoration.none,
            color: Color(0xFFB4D6FF),
            fontSize: 15,
            fontFamily: "KaiTi",
          ),
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        color: Colors.white,
      ),
    );
  }
}
