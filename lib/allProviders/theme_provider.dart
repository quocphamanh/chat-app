import 'package:chat_app/allCommons/storage_common.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  late ThemeData _themeData;

  ThemeProvider(String isDarkMode) {
    _themeData = isDarkMode == 'dark' ? darkTheme : lightTheme;
  }

  final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColor: Colors.black,
    colorScheme: ColorScheme.dark(),
    iconTheme: IconThemeData(color: Colors.purple.shade200, opacity: 0.8),
  );

  final lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.white,
    colorScheme: ColorScheme.light(),
    iconTheme: IconThemeData(color: Colors.red, opacity: 0.8),
  );

  Future<bool?> getThemeMode() async {
    var isDarkMode = await StorageManager.readData('themeMode');
    if (isDarkMode == 'light') {
      return false;
    } else {
      return true;
    }
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }

  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }

  ThemeData getTheme() => _themeData;
}
