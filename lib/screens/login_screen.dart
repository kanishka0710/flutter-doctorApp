
import 'package:doctorApp/screens/screens.dart';
import "package:flutter/material.dart";
import "package:doctorApp/config/styles.dart";
import "package:doctorApp/config/palette.dart";

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
            child: Column(
          children: <Widget>[
            Container(
              height: 330,
              child: Stack(
                children: <Widget>[
                  Positioned(
                      left: 0,
                      top: 0,
                      child: Image.asset(
                        'images\\login_art.png',
                      )),
                  Positioned(
                      left: 30,
                      top: 250,
                      child: Text("Login",
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.w500,
                          ))),
                  Positioned(
                    left: 30,
                    top: 300,
                    child: Container(
                        height: 4, width: 70, color: Palette.primaryBlue),
                  ),
                ],
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(5),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                        color: Colors.grey[700],
                                      )),
                                ))
                          ],
                        ))
                  ],
                )),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Column(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                                padding: EdgeInsets.all(5),
                                child: TextField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                        color: Colors.grey[700],
                                      )),
                                ))
                          ],
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => MainScreen()));
                      },
                      child: Container(
                          height: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [
                                Palette.primaryRed,
                                Color.fromRGBO(247, 128, 106, .5)
                              ])),
                          child: Text('Login',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ))),
                    ),
                  ],
                ))
          ],
        )));
  }
}
