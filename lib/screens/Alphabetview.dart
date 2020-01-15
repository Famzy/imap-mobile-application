import 'package:flutter/material.dart';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:i_map/models/Library.dart';

class Alphabetview extends StatefulWidget {
  @override
  _AlphabetviewState createState() => _AlphabetviewState();
}

class _AlphabetviewState extends State<Alphabetview> {
  // var  = Library.words.asMap();
  Library _library = new Library();
  var words = [
    'A',
    'Capital letter B',
    'Capital letter C',
    'Capital letter D',];
  

  @override
  initState() {
    super.initState();
    initTts();
  }

  initTts() {
    flutterTts.setLanguage('en-US');
    flutterTts.setSpeechRate(1.0);
    flutterTts.setVolume(1.0);
    flutterTts.setPitch(1.0);
  }

  List<Widget> _pages = [
    Image.asset('assets/11.png'),
    Image.asset('assets/12.png'),
    Image.asset('assets/13.png'),
    Image.asset('assets/14.png'),
  ];
  final _controller = new PageController();

  final FlutterTts flutterTts = FlutterTts();
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  Widget _buildPage({
    var image,
  }) {
    return Container(
      alignment: Alignment.center,
      child: Image(
        image: AssetImage(image),
      ),
      height: 300.0,
      width: 300.0,
    );
  }

  Widget _buildViewPage() {
    return PageView(
      children: [
        _buildPage(image: 'assets/11.png'),
        _buildPage(image: 'assets/12.png'),
        _buildPage(image: 'assets/13.png'),
        _buildPage(image: 'assets/14.png'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Future _speak([me]) async {
      await flutterTts.speak(me.toString());
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          Flexible(
            child: PageView.builder(
                controller: _controller,
                itemCount: _pages.length,
                itemBuilder: (BuildContext context, int index) {
                  return _pages[index % _pages.length];
                }),
          ),
          Center(
            child: Container(
                color: Colors.white,
                height: 80.0,
                child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.arrow_back_ios,
                            size: 30.0,
                            color: Colors.orange,
                          ),
                          onPressed: () {
                            _controller.previousPage(
                                duration: _kDuration, curve: _kCurve);
                            setState(() {
                              
                             _speak(words.toString());
                             print(words[1].iterator.current);
                             
                            });
                          }),
                      FloatingActionButton(
                        child: Icon(Icons.home),
                        onPressed: () {
                          print('Clicked');
                        },
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.orange,
                      ),
                      IconButton(
                        icon: Icon(Icons.arrow_forward_ios,
                            size: 30.0, color: Colors.orange),
                        onPressed: () {
                          _controller.nextPage(
                              duration: _kDuration, curve: _kCurve);
                        },
                      )
                    ])),
          ),
        ],
      ),
    );
  }
}
