import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_tts/flutter_tts.dart';

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

    TextStyle basestyle = TextStyle(
      color: cf,
      fontFamily: 'germania',
      fontSize: 30,
    );
    TextStyle diastyle = TextStyle(
      color: cf,
      fontFamily: 'germania',
      fontSize: 15,
    );

    final FlutterTts flutterTts = FlutterTts();

    Random random = new Random();

    Future<void> howToPlay() async {
      return showDialog<void>(
        context: context,

        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('How to play?',style: basestyle,),
            backgroundColor: cc,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)),),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text("1. Press start and a random number will be generated\n", style: diastyle,),
                  Text("2. Hear the sound and try to guess the number, if needed press the sound icon to hear the number again\n", style: diastyle,),
                  Text("3. Press verify to see if you got it right\n",style: diastyle,),

                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('Gotcha!',style: TextStyle(
                  color: cf,
                  fontFamily: 'germania',
                  fontSize: 20,
                ),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

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
                        style: basestyle,
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
                  style: basestyle,
                ),
                //streak
                Text(
                  "Streak : $streak",
                  style: basestyle,
                ),
              ],
            ),




            //TODO send this row to the end of the screen without using margin
            Container(
              margin: EdgeInsets.fromLTRB(0, MediaQuery.of(context).size.height * 0.35 , 0,0 ),
              child: Row(
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
                          style: basestyle,
                        ),
                      ),
                    ),
                  ),



                  GestureDetector(
                    onTap: (){
                      howToPlay();
                    },
                    child: Icon(Icons.help,color: cf,size: 70,),),
                ],
              ),
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
