import 'package:flutter/material.dart';

void main() {
  runApp(TrafficLightApp());
}

class TrafficLightApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TrafficLightScreen(),
    );
  }
}

class TrafficLightScreen extends StatefulWidget {
  @override
  _TrafficLightScreenState createState() => _TrafficLightScreenState();
}

class _TrafficLightScreenState extends State<TrafficLightScreen> {
  Color lightColor = Colors.red;

  void changeLight() {
    setState(() {
      if (lightColor == Colors.red) {
        lightColor = Colors.orange;
      } else if (lightColor == Colors.orange) {
        lightColor = Colors.green;
      } else {
        lightColor = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Traffic Light Simulator")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  trafficLightCircle(Colors.red, lightColor == Colors.red),
                  trafficLightCircle(
                      Colors.orange, lightColor == Colors.orange),
                  trafficLightCircle(Colors.green, lightColor == Colors.green),
                ],
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: changeLight,
              child: Text("Change Light"),
            ),
          ],
        ),
      ),
    );
  }

  Widget trafficLightCircle(Color color, bool isActive) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: isActive ? color : Colors.grey[800],
        shape: BoxShape.circle,
      ),
    );
  }
}
