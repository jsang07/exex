import 'package:flutter/material.dart';
import 'package:flutterweb/screens/info_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    stepBox(String step, String stepTitle) {
      return Container(
        child: Column(
          children: [
            Text(step,
                style: TextStyle(
                    fontSize: width * 0.015, fontWeight: FontWeight.w600)),
            Text(stepTitle,
                style: TextStyle(
                    fontSize: width * 0.01, fontWeight: FontWeight.w600))
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        surfaceTintColor: Colors.white,
        title: const Text(
          'MAIDA',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 40),
              child: Text(
                'MAIDA 보충제 AI 제품 추천',
                style: TextStyle(
                    fontSize: width * 0.03, fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                stepBox('step1', '기초 정보 분석'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: width * 0.08,
                    height: height * 0.003,
                    color: Colors.black,
                  ),
                ),
                stepBox('step2', '라이프스타일 분석'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Container(
                    width: width * 0.08,
                    height: height * 0.003,
                    color: Colors.black,
                  ),
                ),
                stepBox('step3', '목표에 따른 AI 추천')
              ],
            ),
            Image.asset(
              'assets/main.png',
              width: width * 0.5,
              height: height * 0.6,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InfoPage(),
                    ));
              },
              child: SizedBox(
                width: width * 0.15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('시작하기 ',
                        style: TextStyle(
                            fontSize: width * 0.02,
                            fontWeight: FontWeight.w700)),
                    Icon(
                      Icons.arrow_circle_right_outlined,
                      size: width * 0.03,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
