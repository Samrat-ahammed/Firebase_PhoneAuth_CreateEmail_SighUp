import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> backgroundHandlar(RemoteMessage message) async {
  log("message recived! ${message.notification!.title}");
}

class NotificationService {
  static Future<void> initilize() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      FirebaseMessaging.onBackgroundMessage(backgroundHandlar);
      FirebaseMessaging.onMessage.listen((message) {
        log("message recived! ${message.notification!.title}");
      });

      log("Notification initilize");
    }
  }
}
