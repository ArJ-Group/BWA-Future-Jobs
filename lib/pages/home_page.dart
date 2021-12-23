import 'package:flutter/material.dart';
import 'package:future_jobs/theme/home_theme.dart';
import 'package:future_jobs/theme/login_theme.dart';
import 'package:future_jobs/widgets/job_card.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget headers() {
      return SafeArea(
        child: Container(
          padding: const EdgeInsets.only(top: 30, left: 24, right: 20),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Howdy',
                    style: titleTextStyle,
                  ),
                  Text(
                    'Jason Powell',
                    style: subtitleTextStyle,
                  )
                ],
              ),
              const Spacer(),
              Image.asset(
                'assets/icons/user_pic.png',
                width: 58,
                height: 58,
              )
            ],
          ),
        ),
      );
    }

    Widget body() {
      return Padding(
        padding: const EdgeInsets.only(left: 25, top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hot Categories',
              style: GoogleFonts.poppins(
                  color: const Color(0xff272C2F),
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
            ),
            const SizedBox(
              height: 16,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: const [
                JobCard(
                  jobTitle: 'Mobile Developer',
                  imageUrl: 'assets/card/card_category.png',
                ),
                SizedBox(
                  width: 16,
                ),
                JobCard(
                  jobTitle: 'App Designer',
                  imageUrl: 'assets/card/bg1.png',
                ),
                SizedBox(
                  width: 16,
                ),
                JobCard(
                  jobTitle: 'Content Writter',
                  imageUrl: 'assets/card/bg2.png',
                ),
                SizedBox(
                  width: 16,
                ),
                JobCard(
                  jobTitle: 'Video Grapher',
                  imageUrl: 'assets/card/bg3.png',
                )
              ]),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2),
              child: Text(
                'Just Posted',
                style: GoogleFonts.poppins(
                    color: const Color(0xff272C2F),
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 16,),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 2),
                  child: Image.asset(
                    'assets/jobs/facebook.png',
                    height: 45,
                    width: 45,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    'Front-End Developer',
                    style: jobTextStyle,
                  ),
                  Text(
                    'Google',
                    style: companyTextStyle,
                  )
                ])
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [headers(), body()],
      ),
    );
  }
}
