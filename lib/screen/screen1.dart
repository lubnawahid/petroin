import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:petro/screen/screen2.dart';

import 'logincontroller.dart';




class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  void _togglePasswordVisibility(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          Align(alignment: Alignment.center,
            child: Text('welcome back!',style: TextStyle(color:Colors.black,fontSize: 17),textAlign: TextAlign.center,),

          ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            controller: TextEditingController(),
            decoration: InputDecoration(
              prefixIcon:Icon(Icons.person),
              labelText: "username",
              hintText: "username",
              border: OutlineInputBorder(borderRadius:BorderRadius.circular(30)),

            ),


          ),
        ),SizedBox(height: 20),

        Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            controller: TextEditingController(),

            obscureText: _obscureText,
            decoration: InputDecoration(

              prefixIcon: Icon(Icons.lock),
              labelText: "password",



              border:
              OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30)),
              suffixIcon:IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: _togglePasswordVisibility,
              ),
            ),

          ),
        ),
        SizedBox(height: 20,),
        TextButton(onPressed: (){
          // Navigator.push(
          //     context, MaterialPageRoute(builder: (context) => fpassword()));
        },
          child:Text("Forgot Password?",style: TextStyle(color:Color(0xFF387B74),fontSize: 14),),


        ),
        ElevatedButton(
          // child: Text("Login",style: TextStyle(color: Colors.white),),
          onPressed: () {
            _loginController.login(
              Get.find<TextEditingController>().text,
              Get.find<TextEditingController>().text,
            );
          },
          child: Obx(() {
            return _loginController.isLoading.value
                ? CircularProgressIndicator()
                : Text('Login');
          }),
            ),
            SizedBox(height: 30.0,),
            Row(
            children: [
            const Text('Does not have an account?',style:TextStyle(fontSize: 16),),
            SizedBox(width: 10,),
            TextButton(onPressed: (){
           // Navigator.push(context, MaterialPageRoute(builder: (context)=>Registration()));
            },
    child: const Text('Register Here',style: TextStyle(color:Color(0xFF387B74),fontSize: 16),),
    ),

    ],
    mainAxisAlignment: MainAxisAlignment.center,
    ),



    ],

    )

    ),
    );

    }
  }
