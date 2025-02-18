import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int intake = 0;
  int limit = 2000;
  double progress = 0;
  void addwater(int number) {
    if (intake < limit) {
      intake = (intake + number).clamp(0, limit);
      progress = (intake / limit.toDouble());
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 161, 185, 250),
        appBar: AppBar(
          title: Text(
            'Water Tracking',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
        ),
        body: Column(
          spacing: 10,
          children: [
            SizedBox(height: 10),
            Custom_Card(
              number: intake,
            ),
            SizedBox(
              height: 10,
            ),
            CircularCustom(
              value: progress,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  addwater(200);
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.glassWaterDroplet),
                  Text('+ 200 ML'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  addwater(500);
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.glassWater),
                  Text('+ 500 ML'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  addwater(1000);
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.bottleWater),
                  Text('+ 1000 ML'),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {});
                  intake = 0;
                  progress = 0;
                },
                child: Text('Reset')),
          ],
        ),
      ),
    );
  }
}

class CircularCustom extends StatelessWidget {
  final double value;
  const CircularCustom({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    final percentage = (value * 100).toInt();
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: CircularProgressIndicator(
            value: value,
            strokeWidth: 10,
            color: Colors.white,
          ),
        ),
        Text(
          '${percentage}%',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class Custom_Card extends StatelessWidget {
  final int number;
  const Custom_Card({super.key, required this.number});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 140,
        height: 90,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),

        //color: Colors.amber,
        child: Column(
          children: [
            Text(
              'Today \'s Intake',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              ' ${number} ML',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
