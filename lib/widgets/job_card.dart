import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class JobCard extends StatelessWidget {
  const JobCard({ Key? key, this.jobTitle, this.imageUrl }) : super(key: key);
  
  final String? jobTitle;
  final String? imageUrl;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageUrl.toString())
        )
      ),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 16),
          child: Text(jobTitle.toString(), style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),),
        ),
      ),
    );
  }
}