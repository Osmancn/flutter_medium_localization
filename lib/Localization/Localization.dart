import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'Languages/BaseLanguage.dart';
import 'Languages/EnLanguage.dart';
import 'Languages/TrLanguage.dart';

class Localization {
  final Locale appLocale;

  static const List<String> suportedLanguage = ["en", "tr"];

  Localization(this.appLocale) {
    _load();
  }

  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization);
  }

  BaseLanguage language;

  void _load() {
    switch(appLocale.languageCode)
    {
      case "tr": language=TrLanguage(); break;
      default:language=EnLanguage();
    }

  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<Localization> {
  @override
  Future<Localization> load(Locale locale) {
    return SynchronousFuture<Localization>(Localization(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<Localization> old) => false;

  @override
  bool isSupported(Locale locale) => Localization.suportedLanguage.any((e) => e == locale.languageCode.toLowerCase());
}
