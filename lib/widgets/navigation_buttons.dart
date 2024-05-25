import 'package:flutter/material.dart';

class NavButtonWidget extends StatelessWidget {
  const NavButtonWidget(
      {super.key,
      required this.title,
      required this.onTap,
      required this.icon});
  final String title;
  final VoidCallback onTap;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Image.asset(
              "assets/$icon",
              scale: 1.5,
            ),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
