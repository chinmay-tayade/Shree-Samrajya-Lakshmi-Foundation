import 'dart:convert';
import 'package:flutter/material.dart';
import '../utils/AppWidget.dart';
import '../utils/colors.dart';
import '../utils/constant.dart';
import 'package:nb_utils/nb_utils.dart';
import '../utils/images.dart';
import 'DashboardScreen.dart';
import 'WalkThroughScreen1.dart';
import 'WalkThroughScreen2.dart';
import 'WalkThroughScreen3.dart';
import '../model/MainResponse.dart' as model1;

class SplashScreen extends StatefulWidget {
  static String tag = '/SplashScreen2';

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  List<model1.Walkthrough> mWalkList = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    Iterable mMenu = jsonDecode(getStringAsync(WALKTHROUGH));
    mWalkList = mMenu.map((model) => model1.Walkthrough.fromJson(model)).toList();

    await Future.delayed(Duration(seconds: 3));
    DashBoardScreen().launch(context, isNewTask: true);
    setState(() {});
  }


  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Colors.grey
            ],
          ),
        ),


        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App logo
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    image: AssetImage('assets/ic_logo.png'), // Replace with your app icon path
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                'Shree Samrajyalakshmi\nMaha Samsthanam',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffa32d3b),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // return Scaffold(
    //   body: getStringAsync(SPLASH_ENABLE_BACKGROUND) == "true"
    //       ? Stack(
    //           alignment: Alignment.center,
    //           children: [
    //             // cachedImage(getStringAsync(SPLASH_BACKGROUND_URL), fit: BoxFit.cover, height: context.height(), width: context.width()),
    //             // Column(
    //             //   crossAxisAlignment: CrossAxisAlignment.center,
    //             //   mainAxisAlignment: MainAxisAlignment.center,
    //             //   children: [
    //             //     getStringAsync(SPLASH_ENABLE_LOGO).validate() != "false"
    //             //         ? cachedImage(getStringAsync(SPLASH_LOGO_URL), fit: BoxFit.cover, height: 120, width: 120).cornerRadiusWithClipRRect(10)
    //             //         : SizedBox(),
    //             //     4.height,
    //             //     getStringAsync(SPLASH_ENABLE_TITLE) != "false"
    //             //         ? Text(
    //             //             getStringAsync(SPLASH_TITLE),
    //             //             style: boldTextStyle(size: 20, color: getColorFromHex(getStringAsync(SPLASH_TITLE_COLOR), defaultColor: primaryColor1)),
    //             //             textAlign: TextAlign.center,
    //             //           ).paddingSymmetric(horizontal: 12)
    //             //         : SizedBox(),
    //             //   ],
    //             // ).center(),
    //           ],
    //         )
    //       : Container(
    //           decoration: BoxDecoration(
    //             gradient: LinearGradient(
    //               begin: Alignment.topLeft,
    //               end: Alignment.bottomRight,
    //               colors: [
    //                 getColorFromHex(getStringAsync(SPLASH_FIRST_COLOR), defaultColor: primaryColor1),
    //                 getColorFromHex(getStringAsync(SPLASH_SECOND_COLOR), defaultColor: primaryColor1),
    //               ],
    //             ),
    //           ),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: [
    //               getStringAsync(SPLASH_ENABLE_LOGO) != "false" ? cachedImage(getStringAsync(SPLASH_LOGO_URL), fit: BoxFit.cover, height: 120, width: 120).cornerRadiusWithClipRRect(10) : SizedBox(),
    //               getStringAsync(SPLASH_ENABLE_TITLE) != "false"
    //                   ? Text(getStringAsync(SPLASH_TITLE), style: boldTextStyle(size: 20, color: getColorFromHex(getStringAsync(SPLASH_TITLE_COLOR), defaultColor: primaryColor1)))
    //                   : SizedBox(),
    //             ],
    //           ).center(),
    //         ),
    // );
  }
}
