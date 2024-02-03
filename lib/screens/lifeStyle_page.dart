import 'package:carousel_slider/carousel_slider.dart';


import 'package:flutter/material.dart';


import 'package:flutterweb/screens/result_page.dart';


class LifeStylePage extends StatefulWidget {

  const LifeStylePage({Key? key}) : super(key: key);


  @override

  State<LifeStylePage> createState() => _LifeStylePageState();

}


class _LifeStylePageState extends State<LifeStylePage> {

  CarouselController carouselController = CarouselController();


  int _current = 0;


  Map<int, String> _selectedOptions = {};


  final List<Map<String, dynamic>> _surveyData = [

    {

      'question': 'Q1.\n나의 단백질\n섭취 목적은\nOOO이다.',

      'options': ['워너비 헐크', '유지어터', '빅사이즈 탈출'],

      'options2': ['체중⬆근육⬆', '근육ￚ체지방⬇', '체중⬇체지방⬇'],

      'imagePath': 'assets/strength.png',

      'color': Colors.blue,

    },

    {

      'question': 'Q2.\n나는 우유 섭취 시\n장이 예민하게\n반응하는 편이다.',

      'options': ['O', 'X'],

      'imagePath': 'assets/milk.png',

      'color': Colors.teal

    },

    {

      'question': 'Q3.\n나는 숨이 턱 끝까지 차는\n고강도 운동을\n주 3회 이상 한다.',

      'options': ['O', 'X'],

      'imagePath': 'assets/dumbell.png',

      'color': Colors.amber

    },

    {

      'question': 'Q4.\n나는 운동 전 후\n피로관리가 필요하다.',

      'options': ['O', 'X'],

      'imagePath': 'assets/fatigue.png',

      'color': Colors.brown

    },

    {

      'question': 'Q5.\n나는 운동을 통해\n근육증진 뿐만 아니라\n체지방 감소도 기대한다.',

      'options': ['O', 'X'],

      'imagePath': 'assets/bmi.png',

      'color': Colors.purpleAccent

    },

    {

      'question': 'Q6.\n나는 탄수화물 식품과\n절대 헤어질 수 없다.',

      'options': ['O', 'X'],

      'imagePath': 'assets/ramen.png',

      'color': Colors.redAccent

    },

  ];


  @override

  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white10,

      appBar: AppBar(),

      body: Padding(

        padding: const EdgeInsets.only(top: 30, bottom: 100),

        child: SingleChildScrollView(

          child: Column(

            children: [

              const Text(

                'Step 2. 라이프스타일 분석',

                textAlign: TextAlign.center,

                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),

                maxLines: 1,

              ),

              const Text(

                '고객님의 추천 상품을 위해 간단한 설문을 진행해주세요.',

                textAlign: TextAlign.center,

                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),

                maxLines: 1,

              ),

              const SizedBox(

                height: 20,

              ),

              CarouselSlider(

                carouselController: carouselController,

                items: _surveyData.map((survey) {

                  String question = survey['question'] as String;


                  List<String> options = survey['options'] as List<String>;


                  String imagePath = survey['imagePath'] as String;


                  Color color = survey['color'] as Color;


                  List<String>? options2 = survey['options2'] as List<String>?;


                  int index = _surveyData.indexOf(survey);


                  return Builder(

                    builder: (BuildContext context) {

                      return Container(

                        width: 500,

                        decoration: BoxDecoration(

                          image: DecorationImage(

                            image: AssetImage(imagePath),

                            alignment: Alignment.topRight,

                          ),

                          color: color,

                          borderRadius: BorderRadius.circular(10),

                        ),

                        child: Padding(

                          padding: const EdgeInsets.all(8.0),

                          child: Column(

                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [

                              const SizedBox(height: 20),

                              Row(

                                children: [

                                  const SizedBox(width: 30),

                                  Text(

                                    question,

                                    style: const TextStyle(

                                        fontSize: 30,

                                        fontWeight: FontWeight.bold,

                                        color: Colors.white),

                                  ),

                                ],

                              ),

                              const Spacer(),

                              Row(

                                mainAxisAlignment: MainAxisAlignment.center,

                                children: options

                                    .asMap()

                                    .entries

                                    .map<Widget>((entry) {

                                  int optionIndex = entry.key;


                                  String option = entry.value;


                                  String? option2 = options2 != null &&

                                          options2.length > optionIndex

                                      ? options2[optionIndex]

                                      : null;


                                  bool isSelected =

                                      _selectedOptions.containsKey(index) &&

                                          _selectedOptions[index] == option;


                                  Widget buttonWidget;


                                  if (option == 'O' || option == 'X') {

                                    buttonWidget = Container(

                                      width: 100,

                                      height: 100,

                                      decoration: BoxDecoration(

                                        shape: BoxShape.circle,

                                      ),

                                      child: ElevatedButton(

                                        onPressed: () {

                                          setState(() {

                                            _selectedOptions[index] = option;

                                          });


                                          goToNextQuestion();

                                        },

                                        style: ElevatedButton.styleFrom(

                                          shape: const CircleBorder(),

                                          primary: isSelected

                                              ? Colors.black

                                              : Colors.white,

                                        ),

                                        child: Center(

                                          child: Text(

                                            option,

                                            style: TextStyle(

                                                color: isSelected

                                                    ? Colors.white

                                                    : color,

                                                fontSize: 60,

                                                fontWeight: FontWeight.bold),

                                          ),

                                        ),

                                      ),

                                    );

                                  } else {

                                    buttonWidget = ElevatedButton(

                                      onPressed: () {

                                        setState(() {

                                          _selectedOptions[index] = option;

                                        });


                                        goToNextQuestion();

                                      },

                                      style: ElevatedButton.styleFrom(

                                        primary: isSelected

                                            ? Colors.black

                                            : Colors.white,

                                        minimumSize: const Size(150, 100),

                                        maximumSize: const Size(150, 100),

                                        padding: EdgeInsets.zero,

                                        shape: RoundedRectangleBorder(

                                          borderRadius:

                                              BorderRadius.circular(50),

                                        ),

                                      ),

                                      child: Column(

                                        mainAxisAlignment:

                                            MainAxisAlignment.center,

                                        children: [

                                          Text(

                                            option,

                                            style: TextStyle(

                                                color: isSelected

                                                    ? Colors.white

                                                    : color,

                                                fontSize: 20,

                                                fontWeight: FontWeight.bold),

                                          ),

                                          if (option2 != null)

                                            Text(

                                              option2,

                                              style: TextStyle(

                                                  color: isSelected

                                                      ? Colors.white

                                                      : color,

                                                  fontSize: 15,

                                                  fontWeight: FontWeight.bold),

                                            ),

                                        ],

                                      ),

                                    );

                                  }


                                  return Row(

                                    children: [

                                      buttonWidget,

                                      SizedBox(

                                          width: option == 'O' || option == 'X'

                                              ? 30

                                              : 10),

                                    ],

                                  );

                                }).toList(),

                              ),

                              const SizedBox(height: 15),

                            ],

                          ),

                        ),

                      );

                    },

                  );

                }).toList(),

                options: CarouselOptions(

                  height: 400,

                  viewportFraction: 0.6,

                  initialPage: 0,

                  enableInfiniteScroll: false,

                  reverse: false,

                  autoPlayCurve: Curves.elasticOut,

                  enlargeCenterPage: true,

                  scrollDirection: Axis.horizontal,

                  onPageChanged: (index, reason) {

                    setState(() {

                      _current = index;

                    });

                  },

                ),

              ),

              Padding(

                padding: const EdgeInsets.symmetric(vertical: 20.0),

                child: SizedBox(

                  width: 500,

                  child: Stack(

                    alignment: Alignment.center,

                    children: [

                      CustomPaint(

                        size: const Size(490, 20),

                        painter: LinePainter(),

                      ),

                      Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                        children: _surveyData.asMap().entries.map((entry) {

                          int index = entry.key;


                          return GestureDetector(

                            onTap: () =>

                                carouselController.animateToPage(index),

                            child: Stack(

                              children: [

                                Container(

                                  width: _current == index ? 24.0 : 12.0,

                                  height: _current == index ? 24.0 : 12.0,

                                  decoration: BoxDecoration(

                                    shape: BoxShape.circle,

                                    color: _current == index

                                        ? _surveyData[index]['color']

                                        : Colors.black,

                                  ),

                                ),

                                if (_current == index)

                                  const Icon(

                                    Icons.graphic_eq_rounded,

                                    color: Colors.white,

                                    size: 24.0,

                                  ),

                                if (_current != index &&

                                    _selectedOptions.containsKey(index))

                                  const Icon(

                                    Icons.check,

                                    color: Colors.white,

                                    size: 12.0,

                                  ),

                              ],

                            ),

                          );

                        }).toList(),

                      ),

                    ],

                  ),

                ),

              ),

              const SizedBox(

                height: 20,

              ),

              if (isAllQuestionsAnswered() &&

                  _selectedOptions.containsKey(_current))

                Padding(

                  padding: const EdgeInsets.only(bottom: 100.0),

                  child: TextButton(

                    onPressed: () {

                      Navigator.push(

                          context,

                          MaterialPageRoute(

                            builder: (context) => ResultPage(),

                          ));

                    },

                    child: const Text(

                      '결과보기',

                      style: TextStyle(

                        fontSize: 30,

                        fontWeight: FontWeight.bold,

                        color: Colors.black,

                      ),

                    ),

                  ),

                ),

            ],

          ),

        ),

      ),

    );

  }


  void goToNextQuestion() {

    // 선택되지 않은 가장 앞의 질문으로 이동


    for (int i = 0; i < _surveyData.length; i++) {

      if (!_selectedOptions.containsKey(i)) {

        carouselController.animateToPage(i);


        setState(() {

          _current = i;

        });


        return;

      }

    }

  }


  bool isAllQuestionsAnswered() {

    return _selectedOptions.length == _surveyData.length;

  }

}


class LinePainter extends CustomPainter {

  @override

  void paint(Canvas canvas, Size size) {

    final paint = Paint()

      ..color = Colors.black

      ..strokeWidth = 1

      ..strokeCap = StrokeCap.round;


    var startPoint = Offset(0, size.height / 2);


    var endPoint = Offset(size.width, size.height / 2);


    canvas.drawLine(startPoint, endPoint, paint);

  }


  @override

  bool shouldRepaint(covariant CustomPainter oldDelegate) {

    return false;

  }

}

