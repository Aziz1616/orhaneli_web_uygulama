import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions? get platformOptions {
    if (kIsWeb) {
      // Web
      return const FirebaseOptions(
          apiKey: "AIzaSyAPrG70hO6O8Bl-JwZLspmmD7TeeW6XlXg",
  authDomain: "orhaneliweb.firebaseapp.com",
  projectId: "orhaneliweb",
  storageBucket: "orhaneliweb.appspot.com",
  messagingSenderId: "444625685238",
  appId: "1:444625685238:web:7ee29bb51923315e9b7ad7",
  measurementId: "G-9DNQ5V1CMM"
      );
    } else if (Platform.isIOS || Platform.isMacOS) {
      // iOS and MacOS
      return const FirebaseOptions(
        apiKey: "AIzaSyAPrG70hO6O8Bl-JwZLspmmD7TeeW6XlXg",
  authDomain: "orhaneliweb.firebaseapp.com",
  projectId: "orhaneliweb",
  storageBucket: "orhaneliweb.appspot.com",
  messagingSenderId: "444625685238",
  appId: "1:444625685238:web:7ee29bb51923315e9b7ad7",
  measurementId: "G-9DNQ5V1CMM"
      );
    } else {
      // Android
      log("Analytics Dart-only initializer doesn't work on Android, please make sure to add the config file.");

      return null;
    }
  }
}