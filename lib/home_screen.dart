import 'package:flutter/material.dart';

import 'widgets/clock_view.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const ClockView(),
      ),
    );
  }
}
