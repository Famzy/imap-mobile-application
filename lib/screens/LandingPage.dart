import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.orange,
      child: new InkWell(
        onTap: ()=> print('we taked it'),
        child:  new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text('i-Map', style: new TextStyle(color: Colors.white, fontSize: 60.0, fontWeight: FontWeight.bold),),
            new Text ('Interactive MultiMedia Alphabet Program', style: new TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold),),
          ],
        ),
      )
    );
  }
  
}