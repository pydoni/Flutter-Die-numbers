import 'package:flutter/material.dart';

import 'RouteManager/routemanager.dart';


void main() {

  runApp(MainPage());
}


class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}
