import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petro/screen/screen1.dart';

import 'color.dart';


class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {

    return Container(

      color: white,
      margin: EdgeInsets.only(top: 50.0),
      height: 80.0,
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
            },
            child:Icon(Icons.menu),
          ),



        ],
      ),
    );
  }
}