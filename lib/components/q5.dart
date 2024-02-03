import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutterweb/data.dart';

class Q5 extends StatefulWidget {
  const Q5({super.key});

  @override
  State<Q5> createState() => _Q5State();
}

class _Q5State extends State<Q5> {
  List<bool> select = [false, false, false, false];
  Color basicColor = Color.fromARGB(255, 250, 230, 213);

  void selected(int firstNum, int secondNum, int thirdNum, int myNum) {
    if (select[firstNum] == false &&
        select[secondNum] == false &&
        select[thirdNum] == false) {
      setState(() {
        select[myNum] = true;
      });
    }
  }

  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
  bool canFlip = false;

  String activity = '';
  String exAct = '';

  void checkCanFlip() {
    if (select[0] == true ||
        select[1] == true ||
        select[2] == true ||
        select[3] == true) {
      setState(() {
        Data.staticQ5 = true;
      });
      if (select[0] == true) {
        setState(() {
          Data.staticActivity = '가벼운 활동';
          Data.staticEx = '(사무직)';
          activity = '가벼운 활동';
          exAct = '(사무직)';
        });
      } else if (select[1] == true) {
        setState(() {
          Data.staticActivity = '중등도 활동';
          Data.staticEx = '(서서하는 업무)';
          activity = '중등도 활동';
          exAct = '(서서하는 업무)';
        });
      } else if (select[2] == true) {
        setState(() {
          Data.staticActivity = '강한 활동';
          Data.staticEx = '(농업, 어업, 건설업 등)';
          activity = '강한 활동';
          exAct = '(농업, 어업, 건설업 등)';
        });
      } else if (select[3] == true) {
        setState(() {
          Data.staticActivity = '아주 강한 활동';
          Data.staticEx = '(운동선수 등)';
          activity = '아주 강한 활동';
          exAct = '(운동선수 등)';
        });
      }

      Future.delayed(const Duration(seconds: 1), () {
        cardKey.currentState?.toggleCard();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;

    selectBox(int f, int s, int t, int four, int my, String title, String ex) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 14.0),
        child: InkWell(
            onTap: () {
              selected(f, s, t, four);
              checkCanFlip();
            },
            child: Container(
              width: width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: select[my] == true ? Colors.black : basicColor),
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w600,
                        color:
                            select[my] == true ? Colors.white : Colors.black),
                  ),
                  Text(
                    ex,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: select[my] == true
                            ? Colors.white
                            : Colors.grey.shade600),
                  ),
                ],
              ),
            )),
      );
    }

    return FlipCard(
      key: cardKey,
      flipOnTouch: false,
      fill: Fill.fillBack,
      direction: FlipDirection.VERTICAL,
      side: CardSide.FRONT,
      front: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(13)),
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Q5.',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '일일 활동량을 알려주세요',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  selectBox(1, 2, 3, 0, 0, '가벼운 활동  ', '(ex.사무직)'),
                  selectBox(0, 2, 3, 1, 1, '중등도 활동  ', '(ex.서서하는 업무)'),
                  selectBox(0, 1, 3, 2, 2, '강한 활동  ', '(ex.농업, 어업, 건설업 등)'),
                  selectBox(0, 1, 2, 3, 3, '아주 강한 활동  ', '(ex.운동선수 등)'),
                ],
              ),
            ],
          ),
        ),
      ),
      back: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.deepPurple[100],
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      activity,
                      style: const TextStyle(
                          fontSize: 26, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      exAct,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            select[0] = false;
                            select[1] = false;
                            select[2] = false;
                            select[3] = false;
                            Data.staticQ5 = false;
                          });
                          cardKey.currentState?.toggleCard();
                        },
                        child: const Icon(
                          Icons.restore_page,
                          size: 30,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
