import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  File _image;
  String _imagepath;

  var token;
  String finalemail="raveenlw44@gmail.com\nashennilurgjgga@gmail.com\nnethmiwarnakula@gmail.com\nsajinirageesha@gmail.com";

  void initState() {

  }



  @override
  Widget build(BuildContext context) {

    String members="SC/2018/10666 W.D.N.P. WARNAKULA.\nSC/2018/10671 A.N.R. VISVAKULA.\nSC/2018/10686 K.R.L.WICKRAMASINGHE.\nSC/2018/10694 W.K.R.S. WALPITA";
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  child: Column(
                      children: [
                        Image(
                          width: 600,
                          height: 250,
                          image: AssetImage("assets/3.png"),
                          fit: BoxFit.contain,
                        ),/*
                        CircleAvatar(
                          radius:50.0,
                          backgroundImage: _image != null
                              ? FileImage(_image)
                              : AssetImage('assets/3.png'),
                        ),*/


                        /*Card(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Great Life for great people"),
                                ],
                              ),
                            ))*/
                      ]),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.lightGreen,
                  child: Center(
                      child: Card(
                          margin: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                          child: Container(
                              width: 310.0,
                              height: 200.0,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Govi Piyasa",
                                      style: TextStyle(
                                        fontSize: 30.0,
                                        fontFamily: 'Indies',
                                        fontWeight: FontWeight.w800,
                                      ),),

                                    Text(
                                      finalemail,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16.0,
                                      ),
                                    ),

                                  ],
                                ),
                              )))),
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.black,
                  child: Center(
                      child: Card(
                          margin: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                          child: Container(
                              width: 310.0,
                              height: 200.0,
                              child: Padding(
                                padding: EdgeInsets.all(10.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "About Us",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w800,

                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey[300],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Group Members",
                                              style: TextStyle(
                                                fontSize: 20.0,
                                              ),
                                            ),
                                            Text(
                                              members,
                                              style: TextStyle(
                                                fontSize: 16.0,
                                                color: Colors.grey[400],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )))),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }}
