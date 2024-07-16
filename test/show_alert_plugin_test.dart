import 'package:flutter_test/flutter_test.dart';
import 'package:show_alert_plugin/show_alert_plugin.dart';
import 'package:show_alert_plugin/show_alert_plugin_platform_interface.dart';
import 'package:show_alert_plugin/show_alert_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockShowAlertPluginPlatform
    with MockPlatformInterfaceMixin
    implements ShowAlertPluginPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');

  @override
  Future<void> showAlertDialog() => Future.value(null);
}

void main() {
  final ShowAlertPluginPlatform initialPlatform =
      ShowAlertPluginPlatform.instance;

  test('$MethodChannelShowAlertPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelShowAlertPlugin>());
  });

  test('getPlatformVersion', () async {
    ShowAlertPlugin showAlertPlugin = ShowAlertPlugin();
    MockShowAlertPluginPlatform fakePlatform = MockShowAlertPluginPlatform();
    ShowAlertPluginPlatform.instance = fakePlatform;

    expect(await showAlertPlugin.getPlatformVersion(), '42');
  });
}
