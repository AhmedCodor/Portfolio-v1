// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:portfolio/src/utils/constants/palette.dart';

class AppTheme{

  TextStyle textStyle(bool isLight, {String fontFam = 'regPoppins', double fontsize = 16}) {
      return TextStyle(fontSize: fontsize, fontFamily: fontFam, color: isLight ? kwhite : kwhite);
    }

  TextTheme getTextTheme(bool isLight) {
      return TextTheme(
          headline1: textStyle(isLight, fontFam: 'boldPoppins'),
          headline2: textStyle(isLight),
          headline3: textStyle(isLight, fontsize: 15),
          bodyText1: textStyle(isLight, fontFam: 'boldPoppins'),
          bodyText2: textStyle(isLight, fontsize: 15),
          caption: textStyle(isLight),
          overline: textStyle(isLight),
          subtitle1: textStyle(isLight),
          subtitle2: textStyle(isLight),
          button: textStyle(isLight))
      .apply(bodyColor: isLight ? kwhite : kwhite, fontFamily: 'semiBoldPoppins');
    }

  ThemeData getAppTheme(){
    return ThemeData(
      visualDensity: VisualDensity.adaptivePlatformDensity,
      primaryColor: Color(0xFF116530),//Color(0xFF1E5128),//kwhite, //kgreen,
      accentColor: kblack,
      fontFamily: 'regPoppins',
      scaffoldBackgroundColor: kblack,
      textTheme: getTextTheme(true),
      highlightColor: kwhite,
       scrollbarTheme: ScrollbarThemeData().copyWith(
          thumbColor: MaterialStateProperty.all(kwhite.withOpacity(0.6)),
        ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(kgreen))
      ),
      buttonTheme: ButtonThemeData(
        buttonColor: kgreen,
        hoverColor: kblack.withOpacity(0.8)
      ),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        backgroundColor: kgreen
      )
    );
  }
}