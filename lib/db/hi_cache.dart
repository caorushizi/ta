import 'package:shared_preferences/shared_preferences.dart';

/// 缓存管理类
class HiCache {
  SharedPreferences preferences;
  HiCache._() {
    init();
  }

  static HiCache _instance;

  HiCache._pre(SharedPreferences prefs) {
    this.preferences = prefs;
  }

  // 预初始化，防止在使用get时，prefs还没有完成初始化
  static Future<HiCache> preInit() async {
    if (_instance == null) {
      var prefs = await SharedPreferences.getInstance();
      _instance = HiCache._pre(prefs);
    }
    return _instance;
  }

  static HiCache getInstance() {
    if (_instance == null) {
      _instance = HiCache._();
    }
    return _instance;
  }

  void init() async {
    if (preferences == null) {
      preferences = await SharedPreferences.getInstance();
    }
  }

  setString(String key, String value) {
    preferences.setString(key, value);
  }

  setDouble(String key, double value) {
    preferences.setDouble(key, value);
  }

  setInt(String key, int value) {
    preferences.setInt(key, value);
  }

  setBool(String key, bool value) {
    preferences.setBool(key, value);
  }

  setStringList(String key, List<String> value) {
    preferences.setStringList(key, value);
  }

  T get<T>(String key) {
    return preferences.get(key);
  }
}
