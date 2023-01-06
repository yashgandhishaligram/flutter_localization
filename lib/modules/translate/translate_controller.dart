
import 'package:flutter/material.dart';
import 'package:flutter_localization/services/connectivity_service.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

import '../../services/translate_service.dart';

class TranslateController extends GetxController {
  TextEditingController textController = TextEditingController();
  var translator = TranslatorService.instance.translator;
  var selectedLanguage = "".obs;
  var output = "".obs;
  var isLoading = false.obs;
  List languagesList = TranslatorService.instance.languages;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  Future translateText(String language) async {
    isLoading.value = true;
    try {
      if(await ConnectivityService.instance.checkIsInternetConnected()) {
        translator.translate(textController.text, to: language)
            .then((value) {
          output.value = value.text;
          isLoading.value = false;
        });
      }else{
        const SnackBar(content: Text("Please check Your Internet Connection"));
      }
    } catch (e) {
      output.value = "can't be translated";
    }
  }
}