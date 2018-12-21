import 'dart:async';

import 'package:flutter/services.dart';

class Clevertap {
  static const MethodChannel _channel =
      const MethodChannel('in.altsoul/clevertap');

  static Future<void> pushEvent({String eventName}) async {
    return await _channel.invokeMethod('pushEvent', {'eventName': eventName});
  }

  static Future<void> pushUser(Map<String, dynamic> profile) async {
    return await _channel.invokeMethod('pushUser', {'profile': profile});
  }
}