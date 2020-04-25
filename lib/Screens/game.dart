import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:io';

class Generator extends StatefulWidget {
  final int difficulty;

  Generator({
    Key key,
    @required this.difficulty,
  }) : super(key: key);

  @override
  _GeneratorState createState() => _GeneratorState();
}

class _GeneratorState extends State<Generator> {
  Color cbg = Color(0xffc2e8ce);
  Color cf = Color(0xffbe7575);
  Color cc = Color(0xfff2eee5);
  Color cb = Color(0xfff6ad7b);

  int streak = 0;
  int number;
  String txtcontent;
  String ttsnumber = "";
  String btnsv = "Start";
  String trytxt = " ";



  @override
  Widget build(BuildContext context) {
    final FlutterTts flutterTts = FlutterTts();

    Random random = new Random();



    Future speak() async {
      await flutterTts.setLanguage("de-DE");
      await flutterTts.setPitch(0.8);
      await flutterTts.setSpeechRate(0.7);
      await flutterTts.speak(ttsnumber);
      print(ttsnumber);
    }

    return Scaffold(
      backgroundColor: cbg,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                GestureDetector(
                  onTap: () => speak(),
                  child: Icon(
                    Icons.volume_up,
                    size: 200,
                    color: cf,
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                // input
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 10, 10),
                  height: 50,
                  width: 150,
                  child: TextField(
                    style: TextStyle(
                      color: cf,
                      fontFamily: 'germania',
                      fontSize: 15,
                    ),

                    decoration: InputDecoration(

                      filled: true,
                      fillColor: cc,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3,color: cb,),
                        borderRadius: BorderRadius.all(Radius.circular(10),),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 3,color: cb,),
                        borderRadius: BorderRadius.all(Radius.circular(10),),
                      ),
                    ),
                    keyboardType: TextInputType.numberWithOptions(),
                    onChanged: (String txt) {
                      txtcontent = txt;
                    },
                  ),
                ),
                // start/verify button
                GestureDetector(
                  onTap: () {
                    startgame(random, speak);

                  },
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 10, 0, 10),
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      color: cc,
                      border: Border.all(
                        color: cb,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        btnsv,
                        style: TextStyle(
                          color: cf,
                          fontFamily: 'germania',
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),

            Column(
              children: <Widget>[
                // got right/got wrong text
                Text(
                  trytxt,
                  style: TextStyle(
                    color: cf,
                    fontFamily: 'germania',
                    fontSize: 30,
                  ),
                ),
                //streak
                Text(
                  "Streak : $streak",
                  style: TextStyle(
                    color: cf,
                    fontFamily: 'germania',
                    fontSize: 30,
                  ),
                ),
              ],
            ),




           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    width: 160,
                    height: 70,
                    decoration: BoxDecoration(
                      color: cc,
                      border: Border.all(
                        color: cb,
                        width: 3,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Return",
                        style: TextStyle(
                          color: cf,
                          fontFamily: 'germania',
                          fontSize: 30,
                        ),
                      ),
                    ),
                  ),
                ),



                Icon(Icons.help,color: cf,size: 70,)
              ],
            ),
          ],
        ),
      ),
    );

  }

  void startgame(Random random, Future speak()) {

    if(btnsv == "Start"){

      setState(() {
        btnsv = "Verify";
      });



      randomizer(random, speak);
    }else{
      verifier(random, speak);
    }
  }

  void randomizer(Random random, Future speak()) {
     number = random.nextInt(widget.difficulty);
    ttsnumber = number.toString();

    speak();
  }

  void verifier(Random random, Future speak()) {
    if (txtcontent == ttsnumber) {
      setState(() {
        streak++;
        trytxt =
        "  You got it right! randomizing...";

        randomizer(random, speak);

      });



    } else {
      print("false");
      setState(() {
        trytxt = "You got it wrong, try again!";
      });
    }
  }
}
