import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppStyles {
  static TextStyle bold16White = GoogleFonts.elMessiri(
      fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.whiteColor);
  static TextStyle bold16Black = GoogleFonts.elMessiri(
      fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.blackColor);
  static TextStyle bold20White = GoogleFonts.elMessiri(
      fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.whiteColor);
  static TextStyle bold20Primary = GoogleFonts.elMessiri(
      fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.primaryDark);
  static TextStyle bold24Black = GoogleFonts.elMessiri(
      fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.blackColor);
  static TextStyle bold24Primary = GoogleFonts.elMessiri(
      fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.primaryDark);
  static TextStyle bold14Black = GoogleFonts.elMessiri(
      fontSize: 18, fontWeight: FontWeight.bold, color: AppColors.blackColor);
}
