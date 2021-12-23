import 'package:flutter/material.dart';
import 'package:future_jobs/pages/home_page.dart';
import 'package:future_jobs/pages/login_page.dart';
import 'package:future_jobs/pages/onboarding_screen.dart';
import 'package:future_jobs/pages/sign_up_screen.dart';
import 'package:future_jobs/pages/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreenPage.routeName: (context) => const SplashScreenPage(),
        OnBoardingScreen.routeName: (context) => const OnBoardingScreen(),
        LoginPageScreen.routeName: (context) => const LoginPageScreen(),
        SignUpScreen.routeName: (context) => const SignUpScreen(),
        HomePageScreen.routeName : (context) => const HomePageScreen()
      },
    );
  }
}
