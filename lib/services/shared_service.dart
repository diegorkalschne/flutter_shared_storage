import 'package:shared_preferences/shared_preferences.dart';

class SharedService {
  static SharedPreferences? _preferences;

  static Future<void> _getPreferences() async {
    if (_preferences == null) {
      SharedPreferences.setPrefix('');
    }
    _preferences ??= await SharedPreferences.getInstance();
  }

  static Future<void> saveBool(String key, bool value, {String suffix = ''}) async {
    await _getPreferences();
    await _preferences!.setBool(key + suffix, value);
  }

  static Future<bool?> getBool(String key, {String suffix = ''}) async {
    await _getPreferences();
    return _preferences!.getBool(key + suffix);
  }

  static Future<void> saveString(String key, String value, {String suffix = ''}) async {
    await _getPreferences();
    await _preferences!.setString(key + suffix, value);
  }

  static Future<String?> getString(String key, {String suffix = ''}) async {
    await _getPreferences();
    return _preferences!.getString(key + suffix);
  }

  static Future<void> saveInt(String key, int value, {String suffix = ''}) async {
    await _getPreferences();
    await _preferences!.setInt(key + suffix, value);
  }

  static Future<int?> getInt(String key, {String suffix = ''}) async {
    await _getPreferences();
    return _preferences!.getInt(key + suffix);
  }

  static Future<void> saveDouble(String key, double value, {String suffix = ''}) async {
    await _getPreferences();
    await _preferences!.setDouble(key + suffix, value);
  }

  static Future<double?> getDouble(String key, {String suffix = ''}) async {
    await _getPreferences();
    return _preferences!.getDouble(key + suffix);
  }

  static Future<void> saveStringList(String key, List<String> value, {String suffix = ''}) async {
    await _getPreferences();
    await _preferences!.setStringList(key + suffix, value);
  }

  static Future<List<String>?> getStringList(String key, {String suffix = ''}) async {
    await _getPreferences();
    return _preferences!.getStringList(key + suffix);
  }
}
