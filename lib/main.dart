import 'dart:math';
import 'package:flutter/material.dart';

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

  String myHand = 'グー';
  String computerHand = 'グー';
  String result = '引き分け';
  

  void updateHands(String selectedHand) {
    setState(() {
      myHand = selectedHand;
      computerHand = generateComputerHand();
    });
  }

  String generateComputerHand() {
    // nextInt() の括弧の中に与えた数字より1小さい値を最高値としたランダムな数を生成する。
    // 3 であれば 0, 1, 2 がランダムで生成される。
    int randomInt = Random().nextInt(3);
    List<String> hands = ['グー', 'チョキ', 'パー'];

    return hands[randomInt];
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
                '相手の手は${computerHand}です。',
                style: TextStyle(
                  fontSize: 32
                ),
              ),
              SizedBox(height: 48),
              Text(
                'あなたの手は${myHand}です。',
                style: TextStyle(
                  fontSize: 32
                ),

              ),
              SizedBox(height: 16,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: (){updateHands('グー');},
                      child: Text('グー'),
                    ),
                    ElevatedButton(
                      onPressed: (){updateHands('チョキ');},
                      child: Text('チョキ'),
                    ),
                    ElevatedButton(
                      onPressed: (){updateHands('パー');},
                      child: Text('パー'),
                    ),
                  ],
                ),
            ],
          ),
        ),
      );
  }
}