import 'package:flutter/material.dart';

import '../services/translate_service.dart';

class TranslatedText extends StatelessWidget {
  const TranslatedText(this.text,
      {Key? key, this.style, this.textAlign, this.overflow, this.builder})
      : super(key: key);
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final ItemWidgetBuilder? builder;
  translatedText() async {
    return await TranslatorService.instance.translate(text);
  }

  Widget textWidget(String text) {
    return Text(
      text,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container();
  }

/*  @override
  Widget build(BuildContext context) {
    return TranslatorService.instance.currentLanguage == 'en'
        ? builder ?? textWidget(text)
        : FutureBuilder(
        future: translatedText(),
        builder: ((context, snapshot) => snapshot.hasData
            ? builder ?? textWidget(snapshot.data)
            : Container()));
  }*/
}