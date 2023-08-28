import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:hair_cut/ad_helper.dart';


void main() {
  runApp(HaircutScheduleScreen());
  MobileAds.instance.initialize();
}
class CutDetailPage extends StatefulWidget {
  @override
  _CutDetailPageState createState() => _CutDetailPageState();
}



class _CutDetailPageState extends State<CutDetailPage> {
  bool isAnimatedContainerVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('カットの詳細情報'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // 垂直方向の中央揃えを追加
          children: [
            Text('クリックするとタイマーが表示されます'),
            Card(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // 水平方向の中央揃えを追加
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TimerScreenFR()));
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 10),

                          margin: EdgeInsets.only(
                            bottom: 10,
                            right: 30,
                          ),
                          width: 85,
                          child: Center( // ここで中央配置を行います
                          child: Image.asset('images/front.webp', width: 85),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TimerScreenBC()));
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 10),

                          margin: EdgeInsets.only(
                            bottom: 10,
                            right: 30,
                          ),
                          width: 85,
                          child: Center( // ここで中央配置を行います
                          child: Image.asset('images/back.webp', width: 85),
                         ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TimerScreenLF()));
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 10),

                          margin: EdgeInsets.only(
                            bottom: 10,
                            right: 30,
                          ),
                          width: 85,
                          child: Center( // ここで中央配置を行います
                          child: Image.asset('images/boy_l.webp', width: 85),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TimerScreenRT()));
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 10),

                          margin: EdgeInsets.only(
                            bottom: 10,
                            right: 30,
                          ),
                          width: 85,
                          child: Center( // ここで中央配置を行います
                          child: Image.asset('images/boy_r.webp', width: 85),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => TimerScreenCL()));
                        },
                        child: Container(
                          padding: EdgeInsets.only(top: 10),

                          margin: EdgeInsets.only(
                            bottom: 10,
                            right: 30,
                          ),
                          width: 85,
                          child: Center( // ここで中央配置を行います
                          child: Image.asset('images/clipper.webp', width: 85),
                          ),
                        ),
                      ),
                      // 他のウィジェットも同様に追加
                      // AdMobバナー広告の表示
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: AdWidget(
                          ad: BannerAd(
                            adUnitId: AdHelper.bannerAdUnitId,
                            size: AdSize.banner,
                            request: AdRequest(),
                            listener: BannerAdListener(
                              onAdFailedToLoad: (ad, error) {
                                print('Ad failed to load: $error');
                              },
                            ),
                          ),
                          key: UniqueKey(),
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),
            // カット終了ボタンも追加
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HaircutScheduleContent()));
              },
              child: Text('カット終了！'),
            ),
            Text('カットスケジュールに戻る'),
          ],
        ),
      ),
    );
  }
}

class HaircutScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ヘアカットスケジュール画面 VS4',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HaircutScheduleContent(),
    );
  }
}

class HaircutScheduleContent extends StatefulWidget {
  @override
  _HaircutScheduleContentState createState() => _HaircutScheduleContentState();
}

class _HaircutScheduleContentState extends State<HaircutScheduleContent> {
  bool isShampooHidden = false;
  bool isCapeHidden = false;
  bool isScissorHidden = false;
  bool isDryHidden = false;
  bool isColumnHidden = false; // Column の表示状態を管理する変数


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ヘアカットスケジュール'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (!isColumnHidden)
              Column(
                children: [
                  GestureDetector(
                  onTap: () {
                  setState(() {
                    isShampooHidden = !isShampooHidden; // 切り替えるために反転させる
                  });
                  },
                    child: Image.asset(
                      isShampooHidden ? 'images/check.png' : 'images/shampoo.jpeg',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isColumnHidden = true;
                      });
                    },
                    child: Text('外す'),
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
            if (!isColumnHidden)
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isCapeHidden = !isCapeHidden; // 切り替えるために反転させる
                      });
                    },
                    child: Image.asset(
                      isCapeHidden ? 'images/check.png' : 'images/b_cape.webp',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isColumnHidden = true;
                      });
                    },
                    child: Text('外す'),
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
              Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isScissorHidden = !isScissorHidden; // 切り替えるために反転させる
                    });
                  },
                  child: Image.asset(
                    isScissorHidden ? 'images/check.png' : 'images/scissors.webp',
                    width: 100,
                    height: 100,
                  ),
                ),// Replace with your image asset
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CutDetailPage()),
                    );
                  },
                  child: Text('カット詳細ページへ'),
                ),
                Icon(Icons.arrow_drop_down), // Down arrow icon
                ],
              ),
            if (!isColumnHidden)
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isDryHidden = !isDryHidden; // 切り替えるために反転させる
                      });
                    },
                    child: Image.asset(
                      isDryHidden ? 'images/check.png' : 'images/dry.jpeg',
                      width: 100,
                      height: 100,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isColumnHidden = true;
                      });
                    },
                    child: Text('外す'),
                  ),
                  Icon(Icons.arrow_drop_down),
                ],
              ),
              Column(
              children: [
                Image.asset(
                  'images/smile.png',
                  width: 100,
                  height: 100,
                ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class TimerScreenFR extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreenFR> {
  late Timer _timer;
  int _seconds = 0;
  int _totalDuration = 180; // タイマーの総時間（秒）
  double _progress = 1.0; // 円の色の進行状況

  @override
  void initState() {
    super.initState();
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, _updateTimer);
  }

  void _updateTimer(Timer timer) {
    setState(() {
      _seconds++;
      _progress = 1 - (_seconds / _totalDuration);

      if (_seconds >= _totalDuration) {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('タイマー')),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: CustomPaint(
            painter: TimerPainter(progress: _progress),
          child: Center(
          child: Image.asset('images/front.webp', width: 85),
            ),
          ),
        ),
        ),
    );
  }
}

class TimerScreenBC extends StatefulWidget {
  @override
  _TimerScreenStateBC createState() => _TimerScreenStateBC();
}

class _TimerScreenStateBC extends State<TimerScreenBC> {
  late Timer _timer;
  int _seconds = 0;
  int _totalDuration = 180; // タイマーの総時間（秒）
  double _progress = 1.0; // 円の色の進行状況

  @override
  void initState() {
    super.initState();
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, _updateTimer);
  }

  void _updateTimer(Timer timer) {
    setState(() {
      _seconds++;
      _progress = 1 - (_seconds / _totalDuration);

      if (_seconds >= _totalDuration) {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('タイマー')),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: CustomPaint(
            painter: TimerPainter(progress: _progress),
            child: Padding(
            padding: EdgeInsets.only(top: 100),
            child: Center(
              child: Image.asset('images/back.webp', width: 85),
            ),
          ),
        ),
        ),
      ),
    );
  }
}

class TimerScreenLF extends StatefulWidget {
  @override
  _TimerScreenStateLF createState() => _TimerScreenStateLF();
}

class _TimerScreenStateLF extends State<TimerScreenLF> {
  late Timer _timer;
  int _seconds = 0;
  int _totalDuration = 180; // タイマーの総時間（秒）
  double _progress = 1.0; // 円の色の進行状況

  @override
  void initState() {
    super.initState();
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, _updateTimer);
  }

  void _updateTimer(Timer timer) {
    setState(() {
      _seconds++;
      _progress = 1 - (_seconds / _totalDuration);

      if (_seconds >= _totalDuration) {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('タイマー')),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: CustomPaint(
            painter: TimerPainter(progress: _progress),
            child: Padding(
            padding: EdgeInsets.only(top: 100),
            child: Center(
              child: Image.asset('images/boy_l.webp', width: 85),
            ),
          ),
        ),
        ),
      ),
    );
  }
}

class TimerScreenRT extends StatefulWidget {
  @override
  _TimerScreenStateRT createState() => _TimerScreenStateRT();
}

class _TimerScreenStateRT extends State<TimerScreenRT> {
  late Timer _timer;
  int _seconds = 0;
  int _totalDuration = 180; // タイマーの総時間（秒）
  double _progress = 1.0; // 円の色の進行状況

  @override
  void initState() {
    super.initState();
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, _updateTimer);
  }

  void _updateTimer(Timer timer) {
    setState(() {
      _seconds++;
      _progress = 1 - (_seconds / _totalDuration);

      if (_seconds >= _totalDuration) {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('タイマー')),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: CustomPaint(
            painter: TimerPainter(progress: _progress),
            child: Padding(
            padding: EdgeInsets.only(top: 100),
            child: Center(
              child: Image.asset('images/boy_r.webp', width: 85),
            ),
          ),
        ),
        ),
      ),
    );
  }
}

class TimerScreenCL extends StatefulWidget {
  @override
  _TimerScreenStateCL createState() => _TimerScreenStateCL();
}

class _TimerScreenStateCL extends State<TimerScreenCL> {
  late Timer _timer;
  int _seconds = 0;
  int _totalDuration = 180; // タイマーの総時間（秒）
  double _progress = 1.0; // 円の色の進行状況

  @override
  void initState() {
    super.initState();
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, _updateTimer);
  }

  void _updateTimer(Timer timer) {
    setState(() {
      _seconds++;
      _progress = 1 - (_seconds / _totalDuration);

      if (_seconds >= _totalDuration) {
        _timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('タイマー')),
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          child: CustomPaint(
            painter: TimerPainter(progress: _progress),
            child: Padding(
            padding: EdgeInsets.only(top: 100),
            child: Center(
              child: Image.asset('images/clipper.webp', width: 85),
            ),
          ),
        ),
      ),
      ),
    );
  }
}

class TimerPainter extends CustomPainter {
  final double progress;

  TimerPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint blackPaint = Paint()..color = Colors.red;
    Paint redPaint = Paint()..color =Color.fromARGB(255, 151, 145, 255);

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = min(centerX, centerY);

    canvas.drawCircle(Offset(centerX, centerY), radius, blackPaint);
    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      -pi / 2,
      -pi * 2 * progress,
      true,
      redPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
