import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
            Custom_Card(),
            SizedBox(
              height: 10,
            ),
            CircularCustom(),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.glassWaterDroplet),
                  Text('+ 200 ML'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(FontAwesomeIcons.glassWater),
                  Text('+ 500 ML'),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
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
            ElevatedButton(onPressed: () {}, child: Text('Reset')),
          ],
        ),
      ),
    );
  }
}

class CircularCustom extends StatelessWidget {
  const CircularCustom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: CircularProgressIndicator(
            value: 0.6,
            strokeWidth: 10,
            color: Colors.white,
          ),
        ),
        Text(
          '100%',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class Custom_Card extends StatelessWidget {
  const Custom_Card({
    super.key,
  });

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
              ' 0 ML',
              style: TextStyle(fontSize: 20, color: Colors.blue),
            )
          ],
        ),
      ),
    );
  }
}
