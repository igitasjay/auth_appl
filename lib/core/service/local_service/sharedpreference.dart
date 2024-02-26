import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

class SharedPreference extends ChangeNotifier {
  final String onBoardingCompletedKey = 'onBoardingCompleted';
  static const String loggedIn = 'isLoggedIn';
  static const String twoFaBool = 'twoFaBool';
  static const String themeMode = 'isDarkMode';
  final String tokenKey = 'token';

  /// clear shared preferences
  Future<void> clear() async {
    prefs = await SharedPreferences.getInstance();
    await prefs!.clear();
  }

  Future<void> logout() async {
    prefs = await SharedPreferences.getInstance();
    await prefs?.remove(twoFaBool);
    await prefs?.remove(onBoardingCompletedKey);
    await prefs?.remove(loggedIn);
  }

  /// cache token
  void saveToken(String id) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString(tokenKey, id);
    notifyListeners();
  }

  /// get user token
  Future<String> getToken() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getString(tokenKey) ?? '';
  }

  /// cache app first launch
  void saveOnBoardingCompleted(bool id) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setBool(onBoardingCompletedKey, id);
    notifyListeners();
  }

  /// get app first launch
  Future<bool> getOnBoardingCompleted() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getBool(onBoardingCompletedKey) ?? false;
  }

  /// cache user logged in
  void saveIsLoggedIn(bool id) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setBool(loggedIn, id);
    notifyListeners();
  }

  /// get user logged in
  Future<bool> getIsLoggedIn() async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getBool(loggedIn) ?? false;
  }

  Future<bool> getTheme() async {
    prefs = await SharedPreferences.getInstance();
    String value = prefs!.getString(themeMode) ?? '';
    if (value != "true") {
      return false;
    } else {
      return true;
    }
  }

  void setTheme(bool value) async {
    prefs = await SharedPreferences.getInstance();
    prefs!.setString(themeMode, value.toString());
    notifyListeners();
  }
}
