import 'package:flutter/material.dart';
import 'package:get/get.dart';
 import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:graduationproject/services/notification.dart';
 import 'home_page.dart';
import 'page2.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initializeNotification();
  // Create an instance of MyHomePage
  MyHomePage myHomePage = MyHomePage();

  runApp(MyApp(homePage: myHomePage));
}
class MyApp extends StatelessWidget {
  final MyHomePage homePage;
  const MyApp({Key? key, required this.homePage});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
       }),
      debugShowCheckedModeBanner: false,
      home: StepCounter(), // Use the passed instance of MyHomePage
    );
  }
}

