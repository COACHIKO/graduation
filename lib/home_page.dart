import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/page2.dart';
import 'package:graduationproject/services/notification.dart';
import 'package:sensors_plus/sensors_plus.dart';

NotificationService notificationService = NotificationService();
String currentState="Unknown";
 int selectedId=99;
 Map<int,String> personPossibleStatuses= {
   0:"Sleeping",
   1:"Studying",
   2:"Training",
   99:"Unknown"
  };
double movementThreshold = 12;
double  acceleration=0;
bool isMoving = false;
DateTime lastMovementTime = DateTime.now();

class MyHomePage extends StatelessWidget  {


   MyHomePage({Key? key}) {
     void initState() {
       AwesomeNotifications().cancelAllSchedules();

       // Initialize sensor listeners
       accelerometerEvents.listen((AccelerometerEvent event) {
         // Calculate total acceleration
           acceleration = event.x + event.y + event.z;
          // Threshold to consider as movement (you can adjust this value)
       });

         if (acceleration  > movementThreshold) {
             isMoving = true;
             print(acceleration);
             notificationService.showNotificationEveryFiveMinutes();
             lastMovementTime = DateTime.now();
         } else if (isMoving==false && DateTime.now().difference(lastMovementTime)<10.minutes) {}


             isMoving = false;
         notificationService.showNotificationEveryFiveMinutes();

         if(isMoving==false && DateTime.now().difference(lastMovementTime)>=10.minutes){


               currentState =
               "${personPossibleStatuses[selectedId]}";
               Get.offAll(MyHomePage2());


             }


        }
     initState();



   }
   @override
   Widget build(BuildContext context) {
     return   Scaffold(
       appBar: AppBar(),
       body:MaterialButton(onPressed: () {
         print(lastMovementTime);
       },child: Center(child: Text("Current State is : $currentState"),)),
     );
   }
}
