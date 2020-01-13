import 'package:flutter/material.dart';


class HomePage  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text('Interactive Multimedia Alphabet Program (i-Map)'), backgroundColor: Colors.orange,),
          body: Container(
      margin: EdgeInsets.symmetric(vertical: 40.0,horizontal: 20.0),
      height: 200.0,
   
      child: ListView(scrollDirection:Axis.horizontal,
      children: <Widget>[
        Container(
        
            width: 150.0,
          
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/14.png')  )
            ),
            child: FlatButton(
          onPressed: () { print('Clicked'); },
           child: null,
          
          ), 
          ),

          
         
          Container(
            width: 200.0,
           
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/14.png')  )
            ),
            child: FlatButton(
          onPressed: () { print('Clicked'); },
           child: null,
          
          ), 
          ),
        
          Container(
            width: 200.0,
         
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/14.png')  )
            ),
            child: FlatButton(
          onPressed: () { print('Clicked'); },
           child: null,
          
          ), 
          ),
         
          Container(
            
            width: 200.0,
           
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/14.png')  )
            ),
            child: FlatButton(
          onPressed: () { print('Clicked'); },
           child: null,
          
          ), 
          ),
         
          Container(
            width: 200.0,
          
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/14.png')  )
            ),
            child: FlatButton(
          onPressed: () { print('Clicked'); },
           child: null,
          
          ), 
          ),
        
          Container(
            width: 200.0,
           
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/14.png')  )
            ),
            child: FlatButton(
          onPressed: () { print('Clicked'); },
           child: null,
          
          ), 
          ),



          
  
        
        
      ],
      )
      ),
    );
  }
}