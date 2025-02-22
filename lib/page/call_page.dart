import 'package:flutter/material.dart';
import 'package:flutter_video_call/constants/secrets.example.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class CallPage extends StatelessWidget {
  const CallPage({Key? key, required this.callID}) : super(key: key);
  final String callID;

  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: AppSecrets.apiKey, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: AppSecrets.apiSecret, // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: 'user_i',
      userName: 'user_nam',
      callID: callID,
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
    );
  }
}
