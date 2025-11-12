import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Hobbies',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Hobbies'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HobbyCard(
                title: 'Travelling',
                icon: Icons.travel_explore,
                color: Colors.green,
              ),
              SizedBox(height: 10),
              HobbyCard(
                title: 'Skating',
                icon: Icons.directions_run,
                color: Colors.blueGrey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// HobbyCard widget
class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;

  const HobbyCard({
    super.key,
    required this.title,
    required this.icon,
    this.color = Colors.blue, // default color if none provided
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(icon, color: Colors.white, size: 30),
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
