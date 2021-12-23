import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:future_jobs/pages/sign_up_screen.dart';
import 'package:future_jobs/theme/login_theme.dart';

class LoginPageScreen extends StatefulWidget {
  const LoginPageScreen({Key? key}) : super(key: key);
  static const routeName = '/login';

  @override
  State<LoginPageScreen> createState() => _LoginPageScreenState();
}

class _LoginPageScreenState extends State<LoginPageScreen> {
  bool isEmailValid = true;
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Sign In', style: titleTextStyle),
              Text(
                'Build Your Career',
                style: subtitleTextStyle,
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: Column(children: [
                  Image.asset(
                    'assets/icons/6_work.png',
                    width: 252,
                    height: 230,
                  )
                ]),
              ),
              const SizedBox(
                height: 40,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Email Address',
                    style: titleTextStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    controller: emailController,
                    onChanged: (value) {
                      bool isValid = EmailValidator.validate(value);
                      if (isValid) {
                        setState(() {
                          isEmailValid = true;
                        });
                      } else {
                        setState(() {
                          isEmailValid = false;
                        });
                      }
                    },
                    decoration: InputDecoration(
                        fillColor: const Color(0xffF1F0F5),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: isEmailValid
                                  ? const Color(0xff4141A4)
                                  : const Color(0xffFD4F56)),
                          borderRadius: BorderRadius.circular(100),
                        )),
                  )
                ],
              ),
              const SizedBox(height: 18),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Password',
                    style: titleTextStyle,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        fillColor: const Color(0xffF1F0F5),
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(100),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff4141A4)),
                          borderRadius: BorderRadius.circular(100),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                height: 45,
                width: 312,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Sign In',
                    style: buttonTextStyle,
                  ),
                  style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff4141A4),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(66))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 80),
                child: Center(
                  child: InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(SignUpScreen.routeName);
                  },
                  child: Text(
                    'Create New Account',
                    style: signTextStyle,
                  ),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
