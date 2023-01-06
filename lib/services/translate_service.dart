
import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

import 'connectivity_service.dart';

typedef ItemWidgetBuilder = Widget Function(BuildContext context, String text);

class TranslatorService {
  static final TranslatorService instance = TranslatorService._instance();
  TranslatorService._instance();

  String currentLanguage = 'en';
  List<String> languages = [
    "af - Afrikaans",
    "am - Amharic",
    "ar - Arabic",
    "as - Assamese",
    "az - Azerbaijani",
    "bg - Bulgarian",
    "bn - Bengali Bangla",
    "be - Belarusian",
    "bs - Bosnian",
    "ca - Catalan Valencian",
    "cs - Czech",
    "da - Danish",
    "de - German",
    "el - Modern Greek",
    "en - English",
    "es - Spanish Castilian",
    "et - Estonian",
    "eu - Basque",
    "fa - Persian",
    "fi - Finnish",
    "fil - Filipino Pilipino",
    "fr - French",
    "gl - Galician",
    "gsw - Swiss German Alemannic Alsatian",
    "gu - Gujarati",
    "he - Hebrew",
    "hi - Hindi",
    "hr - Croatian",
    "hu - Hungarian",
    "hy - Armenian",
    "id - Indonesian",
    "is - Icelandic",
    "it - Italian",
    "ja - Japanese",
    "ka - Georgian",
    "kk - Kazakh",
    "km - Khmer Central Khmer",
    "kn - Kannada",
    "ko - Korean",
    "ky - Kirghiz Kyrgyz",
    "lo - Lao",
    "lt - Lithuanian",
    "lv - Latvian",
    "mk - Macedonian",
    "ml - Malayalam",
    "mr - Marathi",
    "pl - Polish",
    "ru - Russian",
    "ta - Tamil",
    "te - Telugu",
    "tr - Turkish",
    "uk - Ukrainian",
    "zh - Chinese",
  ];

  /*Future<String> getCurrentLanguage(String language) async {
    var data = await language;
    data ??= await setLanguage('en');
    if (!await ConnectivityService.instance.checkIsInternetConnected()) {
      data = await setLanguage('en'); //If disconnected, set to english
    }
    currentLanguage = data;
    return data;
  }*/

 /* Future<String> setLanguage(String code) async {
    var data = await StorageService.read('language');
    currentLanguage = data;
    return data;
  }*/

  GoogleTranslator translator = GoogleTranslator();

  Future<String> translateText(String text) async {
    if (currentLanguage == 'en') {
      return text;
    } else {
      var data = await translator.translate(text, to: currentLanguage);
      return data.text;
    }
  }

  Future<String> translate(String data) async {
    Translation text = await translator.translate(data, to: currentLanguage);
    return text.text;
  }
}



