import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petro/screen/profile.dart';
import 'package:petro/screen/space.dart';

import 'color.dart';
import 'custom.dart';


class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),

          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 0.0,
        child: Container(
          height: 100.0,
          color: green,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 40.0,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    bottomNavButton(
                      onPress: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => HomePage(),
                        //     ));
                      },
                      icon: Icons.home_outlined,
                    ),
                    SpaceVH(width: 50),
                    bottomNavButton(
                      onPress: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => feedback(),
                        //     ));
                      },
                      icon: Icons.chat_outlined,
                    ),

                    SpaceVH(width: 50),
                    bottomNavButton(
                      onPress: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Profile(),
                            ));
                      },
                      icon: Icons.person_outline_outlined,
                    ),




                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconButton bottomNavButton(
      {required Function() onPress, required IconData icon}) {
    return IconButton(
      onPressed: onPress,
      icon: Icon(
        icon,
        size: 30,
        color: white,
      ),
    );
  }
}