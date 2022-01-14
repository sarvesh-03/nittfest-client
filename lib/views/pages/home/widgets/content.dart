import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nittfest/views/pages/home/widgets/register_button.dart';
import 'package:nittfest/views/themes/app_themes.dart';

class Content extends StatelessWidget {
  final double headerSize;
  final double logoSize;
  final double bodySize;
  final double buttonSize;
  final double gapSize;
  final double gapSize2;
  final MainAxisAlignment mainAxisAlignment;
  const Content(
      {Key? key,
      required this.headerSize,
      required this.logoSize,
      required this.bodySize,
      required this.buttonSize,
      required this.mainAxisAlignment,
      this.gapSize = 0,
      this.gapSize2 = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: gapSize,
          ),
          Image.asset(
            'assets/logo_nf.png',
            color: AppTheme.bodycolor,
            height: logoSize,
          ),
          Text(
            'INDUCTIONS',
            style: GoogleFonts.poppins(
                fontSize: headerSize,
                fontWeight: FontWeight.bold,
                letterSpacing: 6,
                shadows: AppTheme.shadows,
                color: AppTheme.bodycolor),
          ),
          SizedBox(height: gapSize),
          Text(
            'The Battle Of Departments',
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w900,
                fontSize: bodySize,
                shadows: AppTheme.shadows,
                color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: gapSize2),
          RegisterButton(buttonSize: buttonSize)
        ],
      );
}
