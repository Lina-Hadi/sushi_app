import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_app/components/button.dart';


class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 138, 60, 55),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 25.0,),
            //Shop's name
            Text("YOUR SUSHI",
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 28.0,
              color: Colors.white,
            ),),
            SizedBox(height: 25.0,),
            //icon
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: Image(image: AssetImage('assets/sushi-5.png')),
            ),
            SizedBox(height: 25.0),
            Text('THE TASTE OF JAPANESE FOOD',
            style: GoogleFonts.dmSerifDisplay(
              fontSize: 44,
              color: Colors.white,
            ),),
            SizedBox(height: 10.0,),
            Text('Choose your sushi, and enjoy the taste everywhere and anytime',
            style: TextStyle(
              color: Colors.grey[300],
              height: 2,
            ) ),
            //get started button
            MyButton(text: "Get Started", onTap: () {
              Navigator.pushNamed(context, '/menu');
            },),
          ],
        ),
      ),
    );
  }
}
