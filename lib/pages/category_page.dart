import 'package:flutter/material.dart';
import 'package:bwa_future_jobs/models/category_model.dart';
import 'package:bwa_future_jobs/models/job_model.dart';
import 'package:bwa_future_jobs/providers/job_provider.dart';
import 'package:bwa_future_jobs/theme.dart';
import 'package:bwa_future_jobs/widgets/job_tile.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  final CategoryModel categoryModel;

  CategoryPage(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    var jobProvider = Provider.of<JobProvider>(context);

    Widget header() {
      return Container(
        height: 270,
        width: double.infinity,
        padding: EdgeInsets.only(
          left: defaultMargin,
          bottom: 30,
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              categoryModel.imageUrl,
            ),
          ),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categoryModel.name,
              style: whiteTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              '12,309 available',
              style: whiteTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
          ],
        ),
      );
    }

    Widget companies() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 30,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Big Companies',
              style: blackTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            FutureBuilder<List<JobModel>>(
              future: jobProvider.getJobsByCategory(categoryModel.name),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: snapshot.data
                        .map((e) => JobTile(
                              e,
                            ))
                        .toList(),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            // JobTile(
            //   companyLogo: 'assets/icon_google.png',
            //   name: 'Front-End Developer',
            //   companyName: 'Google',
            // ),
            // JobTile(
            //   companyLogo: 'assets/icon_instagram.png',
            //   name: 'UI Designer',
            //   companyName: 'Instagram',
            // ),
            // JobTile(
            //   companyLogo: 'assets/icon_facebook.png',
            //   name: 'Data Scientist',
            //   companyName: 'Facebook',
            // ),
          ],
        ),
      );
    }

    Widget newStartups() {
      return Container(
        width: double.infinity,
        margin: EdgeInsets.only(
          top: 20,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'New Startups',
              style: blackTextStyle.copyWith(
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            FutureBuilder<List<JobModel>>(
              future: jobProvider.getJobs(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Column(
                    children: snapshot.data
                        .map((e) => JobTile(
                              e,
                            ))
                        .toList(),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
            // JobTile(
            //   companyLogo: 'assets/icon_google.png',
            //   name: 'Front-End Developer',
            //   companyName: 'Google',
            // ),
            // JobTile(
            //   companyLogo: 'assets/icon_instagram.png',
            //   name: 'UI Designer',
            //   companyName: 'Instagram',
            // ),
            // JobTile(
            //   companyLogo: 'assets/icon_facebook.png',
            //   name: 'Data Scientist',
            //   companyName: 'Facebook',
            // ),
          ],
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            header(),
            companies(),
            newStartups(),
          ],
        ),
      ),
    );
  }
}
