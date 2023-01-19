import 'package:flutter/material.dart';
import 'package:flutter_syntax_view/flutter_syntax_view.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String code = r"""
import 'dart:math' as math;

// Coffee class is the best!
class Coffee {
  late int _temperature;

  void heat() => _temperature = 100;
  void chill() => _temperature = -5;

  void sip() {
    final bool isTooHot = math.max(37, _temperature) > 37;
    if (isTooHot)
      print("myyy liiips!");
    else
      print("mmmmm refreshing!");
  }

  int? get temperature => temperature;
}
void main() {
  var coffee = Coffee();
  coffee.heat();
  coffee.sip();
  coffee.chill();
  coffee.sip();
}
/* And there
        you have it */""";


  @override
  Widget build(BuildContext context) {
    SyntaxView syntaxView =  SyntaxView(
      code: code,
      syntax: Syntax.DART,
      syntaxTheme: SyntaxTheme.vscodeLight(),
      fontSize: 12.0,
      withZoom: false,
      withLinesCount: false,
      expanded: true
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Flutter Syntax View",style: TextStyle(fontSize: 15),),
        elevation: 6,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              if (syntaxView.expanded)
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: syntaxView
                )
              else
                syntaxView
            ],
          ),
        ),
      )
    );
  }
}