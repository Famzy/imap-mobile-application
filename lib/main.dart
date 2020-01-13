import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:i_map/screens/Alphabetview.dart';
import 'package:i_map/screens/quizPage.dart';

// import './Pages/Alphabetview.dart';
// import './Pages/LandingPage.dart';
// import './Pages/homePage.dart';
// import './Pages/quizPage.dart';


Future main () async{ 
  await SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
  runApp(new MaterialApp(

  home: new Alphabetview(),
));

}

