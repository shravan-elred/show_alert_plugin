import Flutter
import UIKit

public class ShowAlertPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "show_alert_plugin", binaryMessenger: registrar.messenger())
    let instance = ShowAlertPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("iOS " + UIDevice.current.systemVersion)
    case "showAlertDialog":
      DispatchQueue.main.async {
        let alert = UIAlertController(title: "Alert", message: "Hi, My name is flutter", preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        UIApplication.shared.keyWindow?.rootViewController?.present(alert, animated: true, completion: nil);
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
