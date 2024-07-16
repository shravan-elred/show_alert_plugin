import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'show_alert_plugin_platform_interface.dart';

/// An implementation of [ShowAlertPluginPlatform] that uses method channels.
class MethodChannelShowAlertPlugin extends ShowAlertPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('show_alert_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<void> showAlertDialog() async {
    return await methodChannel.invokeMethod('showAlertDialog');
  }
}
