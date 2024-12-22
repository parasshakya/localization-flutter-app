import 'package:flutter/material.dart';

class LanguageProvider extends ChangeNotifier {
  Locale? _locale;

  setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  Locale? get locale => _locale;
}
