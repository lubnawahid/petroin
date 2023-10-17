import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:petro/screen/screen2.dart';



class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  void _togglePasswordVisibility(){
    setState(() {
      _obscureText = !_obscureText;
    });
  }
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    final String apiUrl = 'https://www.petroinfotech.com/PetroHSE/api/Admin/ValidateLogin';

    final Map<String, dynamic> requestBody = {
      "userName": usernameController.text,
      "password": passwordController.text,
      "authType": "FORMS",
      "ipAddress": "",
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(requestBody),
      );

      if (response.statusCode == 200) {
        // Successful login, handle the response as needed
        final Map<String, dynamic> responseData = jsonDecode(response.body);
        print("Login successful: $responseData");

        // Navigate to the dashboard or another screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Dashboard()), // Replace DashboardScreen() with your desired screen
        );
      } else {
        // Failed login, handle the error
        print("Failed to log in. Status code: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      // Handle any network errors
      print("Error during login: $e");
    }
  }
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
            controller: usernameController,
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
            controller: passwordController,

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
          child: Text("Login",style: TextStyle(color: Colors.white),),
          onPressed: () {
            login();
            style:
            ElevatedButton.styleFrom(shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50.0)),
                primary: Color(0xFF387B74),
                fixedSize: Size(300, 50),
            );
          },
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
