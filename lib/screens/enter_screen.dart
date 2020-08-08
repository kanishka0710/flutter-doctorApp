import 'package:doctorApp/screens/login_screen.dart';
import "package:flutter/material.dart";
import "package:doctorApp/config/palette.dart";

class EnterScreen extends StatefulWidget {
  @override
  _EnterScreenState createState() => _EnterScreenState();
}

class _EnterScreenState extends State<EnterScreen> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Container(
            child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Positioned(
          child: _buildEnterText(screenHeight),
          top: 120,
        ),
        Positioned(
          child: Container(
            height: 140.0,
            width: 140.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(80.0),
              color: Palette.primaryRed,
            ),
            child: IconButton(
              icon: Icon(Icons.arrow_forward, color: Colors.white),
              iconSize: 42,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(right: 20, bottom: 20),
              onPressed: () => {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) => LoginScreen()))
              },
            ),
          ),
          bottom: -50,
          right: -50,
        ),
        Positioned(
            bottom: 150,
            child: Image.asset(
              "images\\doctor_enter.png",
              width: 450,
            ))
      ],
    )));
  }

  Column _buildEnterText(screenHeight) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Welcome",
            style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w600)),
        SizedBox(height: screenHeight * .01),
        Row(
          children: <Widget>[
            Text("to ",
                style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w600)),
            Text("HealthBag",
                style: TextStyle(
                    fontSize: 36.0,
                    fontWeight: FontWeight.w600,
                    color: Palette.primaryBlue))
          ],
        ),
        SizedBox(
          height: screenHeight * .03,
        ),
        Text(
          "Official Public Service Announcement on ",
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: Colors.grey[600]),
        ),
        SizedBox(height: screenHeight * .005),
        Text(
          "Coronavirus from the World Health Organization ",
          style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w400,
              color: Colors.grey[600]),
        ),
      ],
    );
  }
}
