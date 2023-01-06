import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'translate_controller.dart';


class TranslatePage extends StatefulWidget {
  const TranslatePage({Key? key}) : super(key: key);

  @override
  State<TranslatePage> createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  var controller = Get.put(TranslateController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text("Translator"),
      ),
      body: SingleChildScrollView(
        child: Obx(() => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 15),
            child: Column(
              children: [
                TextField(
                controller: controller.textController,
                  decoration:  InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    hintText: 'Enter Text',
                  ),
                  minLines: 1,
                  maxLines: 10,
                  keyboardType: TextInputType.multiline,
                  onTap: (){},
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    buildDialog(context);
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: const BoxDecoration(
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children:  [
                        Text(
                          controller.selectedLanguage.value.isNotEmpty?
                          controller.selectedLanguage.value:
                          "Choose Language",
                          style: TextStyle(
                             fontSize: 18,
                            color: Colors.white
                          ),
                        ),
                        Icon(Icons.arrow_drop_down_circle_sharp,
                        size: 20,
                        color: Colors.white,)
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: () {
                  controller.translateText(controller.selectedLanguage.value.substring(0,2));
                },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    child: Text("Translate",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white
                    ),)),
                SizedBox(
                  height: 15,
                ),
               controller.isLoading.value?
                 CircularProgressIndicator(
                   color: Colors.blue ) :
                 Text(
                   controller.output.value,
                   style: TextStyle(
                       color: Colors.black,
                       fontSize: 25
                   ),
                 ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (builder) {
        return  AlertDialog(
          title: const Text("Choose a Language"),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.separated(
                itemCount: controller.languagesList.length,
                itemBuilder: (context,index) {
                  return  InkWell(
                    onTap: () {
                      controller.selectedLanguage.value = controller.languagesList[index];
                      Navigator.pop(context);
                    },
                    child: Text(
                      controller.languagesList[index],
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  );
                },
                separatorBuilder: (context,index) {
                  return Divider(
                    color: Colors.grey,
                    thickness: 0.1,
                  );
                },
          ),
          ),
        );
      },
    );

  }


}
