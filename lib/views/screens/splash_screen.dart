// ignore_for_file: use_build_context_synchronously

import 'package:e_commers_user/helper/nav/nav_helper.dart';
import 'package:e_commers_user/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  navigationFunction(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 3));
    NavHelper.navigateToWidget(const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    navigationFunction(context);
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/splash.png'),
              fit: BoxFit.cover)),
    );
  }
}
