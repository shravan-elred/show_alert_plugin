import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'show_alert_plugin_method_channel.dart';

abstract class ShowAlertPluginPlatform extends PlatformInterface {
  /// Constructs a ShowAlertPluginPlatform.
  ShowAlertPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static ShowAlertPluginPlatform _instance = MethodChannelShowAlertPlugin();

  /// The default instance of [ShowAlertPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelShowAlertPlugin].
  static ShowAlertPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ShowAlertPluginPlatform] when
  /// they register themselves.
  static set instance(ShowAlertPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    return _instance.getPlatformVersion();
  }

  Future<void> showAlertDialog() async {
    return _instance.showAlertDialog();
  }
}
