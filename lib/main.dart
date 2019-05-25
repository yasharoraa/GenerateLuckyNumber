import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sample App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);
  _SampleAppPageState createState() => _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  String textToShow = "Tap on Button Below";

  String buttonText = "Generate My Lucky Number";

  void _updateText(String i) {
    setState(() {
      textToShow = i;
    });
  }

  void updateButtonText(){
    setState(() {
      buttonText = "Generate a new number again";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/numbers_background.jpg"),
                fit: BoxFit.cover)),
        padding: EdgeInsets.only(bottom: 20),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Container(
                child: Center(
                  child: Text(
                    textToShow,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      // Where the linear gradient begins and ends
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      // Add one stop for each color. Stops should increase from 0 to 1
                      stops: [0.1, 0.5, 0.7, 0.9],
                      colors: [
                        // Colors are easy thanks to Flutter's Colors class.
                        Colors.blue[100],
                        Colors.blue[300],
                        Colors.blue[300],
                        Colors.blue[100],
                      ],
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    border: Border.all(color: Colors.white, width: 1.5)),
                height: 250,
                width: 250,
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding:
                    EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue, width: 2.0),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    )),
                child: Text("Find Your Lucky Number",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15
                ),),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                padding: EdgeInsets.all(15),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 10.0,
                onPressed: () {
                  setNumberContinues();
                },
                child: Text(buttonText,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
  void setNumberContinues() async{
    int _showNumber  = 0;
    for(int i = 0; i <= 101; ++i) {
    await new Future.delayed(const Duration(milliseconds: 20), () {
      if(i==100){
        _showNumber = Random().nextInt(100);
        _updateText(_showNumber.toString());
      } else if(i==101){
        _updateText("Your today's Lucky Number is $_showNumber");
        updateButtonText();
      }else{
          _updateText(Random().nextInt(100).toString());
      }
    });
  }
  }
}

