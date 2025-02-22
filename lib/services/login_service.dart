import 'package:flutter_video_call/constants/secrets.example.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';
import '../constants/constants.dart';

Future<void> login({
  required String userID,
  required String userName,
}) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setString(cacheUserIDKey, userID);

  currentUser.id = userID;
  currentUser.name = 'user_$userID';
}
//
/// local virtual logout
Future<void> logout() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.remove(cacheUserIDKey);
}

void onUserLogin() {
  ZegoUIKitPrebuiltCallInvitationService().init(
    appID: AppSecrets.apiKey /*input your AppID*/,
    appSign: AppSecrets.apiSecret /*input your AppSign*/,
    userID: currentUser.id,
    userName: currentUser.name,
    plugins: [ZegoUIKitSignalingPlugin()],
  );
}

void onUserLogout() {
  ZegoUIKitPrebuiltCallInvitationService().uninit();
}
