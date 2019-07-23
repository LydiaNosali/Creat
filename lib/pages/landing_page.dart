import 'package:flutter/material.dart';
import './quizz_page.dart';
class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.greenAccent,
        child: new InkWell(
          onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context) => new QuizzPage())),
       child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Let's Quizzz",style: new TextStyle(color: Colors.white,fontSize: 50.0,fontWeight: FontWeight.bold)),
            new Text("Tap to start?",style: new TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold)),
          ],
        )));
  }
}
