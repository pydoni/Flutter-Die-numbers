import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Selection extends StatefulWidget {

  @override
  _SelectionState createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {


  Color cbg = Color(0xffc2e8ce);
  Color cf = Color(0xffbe7575);
  Color cc = Color(0xfff2eee5);
  Color cb = Color(0xfff6ad7b);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: cbg,
      body: Column(
        children: <Widget>[



          Stack(
            children: <Widget>[
              Container(
                height: 300,

                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/flag.png"),
                      fit: BoxFit.cover,
                    )),
              ),
              Positioned(
                top: 80,
                left: MediaQuery.of(context).size.width * 0.20,
                child: Container(
                  height: 200,
                  child: Center(
                    child: Text(
                      " Number listening \npractice in german",
                      style:
                      TextStyle(fontSize: 40, color: cf, fontFamily: 'germania'),
                    ),
                  ),
                ),
              ),

            ],
          ),





          Column(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/game',
                    arguments: 100,
                  );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 20, 0, 8),
                  width: 150,
                  height: 60,
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
                      "Easy",
                      style: TextStyle(
                        color: cf,
                        fontFamily: 'germania',
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/game',
                    arguments: 1000,
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  width: 150,
                  height: 60,
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
                      "Normal",
                      style: TextStyle(
                        color: cf,
                        fontFamily: 'germania',
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    '/game',
                    arguments: 999999,
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(8.0),
                  width: 150,
                  height: 60,
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
                      "Hard",
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
          )
        ],
      ),
    );
  }
}
