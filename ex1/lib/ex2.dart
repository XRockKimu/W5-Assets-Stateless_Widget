import 'package:flutter/material.dart';

// ---------- ENUMS ----------
enum ButtonType { primary, secondary, disabled }
enum IconPosition { left, right }

// ---------- MAIN APP ----------
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Buttons',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Custom buttons'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomButton(
                label: 'Submit',
                icon: Icons.check,
                buttonType: ButtonType.primary,
                iconPosition: IconPosition.left,
              ),
              SizedBox(height: 10),
              CustomButton(
                label: 'Time',
                icon: Icons.access_time,
                buttonType: ButtonType.secondary,
                iconPosition: IconPosition.right,
              ),
              SizedBox(height: 10),
              CustomButton(
                label: 'Account',
                icon: Icons.account_circle,
                buttonType: ButtonType.disabled,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------- CUSTOM BUTTON WIDGET ----------
class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
  });

  // Define colors for each button type
  Color _getButtonColor() {
    switch (buttonType) {
      case ButtonType.primary:
        return Colors.blue;
      case ButtonType.secondary:
        return Colors.green;
      case ButtonType.disabled:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _getButtonColor(),
        borderRadius: BorderRadius.circular(40),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: iconPosition == IconPosition.left
              ? [
                  Icon(icon, color: Colors.white),
                  const SizedBox(width: 10),
                  Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ]
              : [
                  Text(
                    label,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(icon, color: Colors.white),
                ],
        ),
      ),
    );
  }
}
