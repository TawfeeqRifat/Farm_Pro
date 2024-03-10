import 'package:farm_pro/Utilities/CustomWidgets.dart';
import 'package:farm_pro/Utilities/custom.dart';
import 'package:farm_pro/sample_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:farm_pro/pages/HomePage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const VerticalPadding(paddingSize: 230),

            OutlinedButton(onPressed: (){},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(
                  color: Colors.transparent,

                ),

              ),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: lightTeal,

                ),
                child: Image.network('http://pngimg.com/uploads/google/google_PNG19635.png',
                  fit: BoxFit.contain,
                ),
              ),),

            const VerticalPadding(paddingSize: 30),

            ElevatedButton(onPressed: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=> const HomePage(detail: details)));
            }, child:
            Text('Guest Login',
              style: TextStyle(
                color: lightTeal,
              ),),

            )

          ],
        ),
      ),
    );
  }
}
