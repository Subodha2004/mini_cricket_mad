import 'package:flutter/material.dart';

import 'dart:math';

void main() {
  runApp(const CricketApp());
}

class CricketApp extends StatelessWidget {
  const CricketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MiniCricket(),
    );
  }
}

class MiniCricket extends StatefulWidget {
  const MiniCricket({super.key});

  @override
  State<MiniCricket> createState() => _MiniCricketState();
}

class _MiniCricketState extends State<MiniCricket> {
  int runs = 0;
  int balls = 6;
  int? lastRuns;

  final Random random = Random();

  void playBall() {
    if (balls == 0) return;

    setState(() {
      lastRuns = random.nextInt(7); // Random number from 0 to 6
      runs += lastRuns!;
      balls--;
    });
  }

  void restartGame() {
    setState(() {
      runs = 0;
      balls = 6;
      lastRuns = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],

      appBar: AppBar(
        title: const Text(
          "Mini Cricket",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Bat and Ball
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Runs
                Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      color: Colors.white,
                      padding: const EdgeInsets.all(8),
                      child: Image.asset('assets/bat.png', fit: BoxFit.contain),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Runs",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),

                    Text(
                      "$runs",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(width: 40),

                // Balls
                Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      color: Colors.white,
                      padding: const EdgeInsets.all(8),
                      child: Image.asset(
                        'assets/ball.png',
                        fit: BoxFit.contain,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "Balls",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),

                    Text(
                      "$balls",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 30),

            // Result - hidden initially
            if (lastRuns != null)
              Text(
                lastRuns == 0 ? "No Runs" : "$lastRuns Runs",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

            const SizedBox(height: 25),

            // Bat / Restart Button
            balls > 0
                ? SizedBox(
                    // RECTANGLE Bat button
                    width: 90,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: playBall,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[900],
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text(
                        "Bat",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  )
                : SizedBox(
                    // RECTANGLE Restart button
                    width: 120,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: restartGame,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: const Text(
                        "Restart",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
