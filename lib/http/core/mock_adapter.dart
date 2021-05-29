import 'package:loveu/http/request/base_request.dart';

import 'hi_adapter.dart';

/// 测试适配器，mock数据
class MockAdapter extends HiNetAdapter {
  @override
  Future<HiNetResponse<T>> send<T>(BaseRequest request) {
    return Future<HiNetResponse>.delayed(Duration(milliseconds: 1000), () {
      return HiNetResponse(
          data: {"code": 0, "message": 'success'}, statusCode: 403);
    });
  }
}
