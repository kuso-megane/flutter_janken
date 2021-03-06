
import 'package:flutter/material.dart';
import 'janken.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Janken page',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: const JankenPage());
  }
}



class JankenPage extends StatefulWidget {
  const JankenPage({Key? key}) : super(key: key);

  @override
  State<JankenPage> createState() => _JankenPageState();
}

class _JankenPageState extends State<JankenPage> {

  JankenHand myHand = JankenHand(id: 0, name: 'block');
  JankenHand computerHand = JankenHand(id: 0, name: 'block');
  String result = 'あいこ';

  

  void updateHands(JankenHand selectedHand) {
    setState(() {
      myHand = selectedHand;
      computerHand = JankenController().generateRandomHand();
    });
  }

  

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('じゃんけん'),
        ),
        body:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '相手の手は${computerHand.name}です。',
                style: TextStyle(
                  fontSize: 32
                ),
              ),
              SizedBox(height: 48),
              Text(
                'あなたの手は${myHand.name}です。',
                style: TextStyle(
                  fontSize: 32
                ),

              ),
              SizedBox(height: 16,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: (){updateHands(JankenHands.block);},
                      child: Text(JankenHands.block.name),
                    ),
                    ElevatedButton(
                      onPressed: (){updateHands(JankenHands.scissors);},
                      child: Text(JankenHands.scissors.name),
                    ),
                    ElevatedButton(
                      onPressed: (){updateHands(JankenHands.paper);},
                      child: Text(JankenHands.paper.name),
                    ),
                  ],
                ),
            ],
          ),
        ),
      );
  }
}