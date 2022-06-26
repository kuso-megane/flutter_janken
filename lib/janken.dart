import 'dart:math';

class JankenHand{
    int id = 0;
    String name = '';

    JankenHand({required int this.id, required String this.name});
}


class JankenHands{
  static JankenHand block = JankenHand(id: 0, name: 'block');
  static JankenHand scissors = JankenHand(id: 1, name: 'scissors');
  static JankenHand paper = JankenHand(id: 2, name: 'paper');
}



class JankenController {

  String judge({required JankenHand myHand, required JankenHand the_other_hand}) {
    int flag = myHand.id - the_other_hand.id;
    if (flag == -1 || flag == 2) {
      return '勝ち';
    }
    else if (flag == 0) {
      return 'あいこ';
    }
    else {
      return '負け';
    }
  }

  JankenHand generateRandomHand() {
    // nextInt() の括弧の中に与えた数字より1小さい値を最高値としたランダムな数を生成する。
    // 3 であれば 0, 1, 2 がランダムで生成される。
    int randomInt = Random().nextInt(3);

    if (randomInt == 0) {
      return JankenHands.block;
    }
    else if (randomInt == 1) {
      return JankenHands.scissors;
    }
    else if (randomInt == 2) {
      return JankenHands.paper;
    }
    else return JankenHands.block;
  }
  
}



