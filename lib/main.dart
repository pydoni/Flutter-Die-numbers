import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'RouteManager/routemanager.dart';


void main() {

  runApp(MainPage());
}


class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
