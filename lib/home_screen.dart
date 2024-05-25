import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'widgets/clock_view.dart';
import 'widgets/navigation_buttons.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('HH:mm').format(now);
    String formattedDate = DateFormat('EEE d MMM').format(now);
    String timezone = now.timeZoneOffset.toString().split('.').first;
    String offsetSign = '';
    if (!timezone.startsWith('-')) offsetSign = '+';
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NavButtonWidget(
                  title: 'Clock',
                  icon: 'clock_icon.png',
                  onTap: () {},
                ),
                NavButtonWidget(
                  title: 'Alarm',
                  icon: 'alarm_icon.png',
                  onTap: () {},
                ),
                NavButtonWidget(
                  title: 'Timer',
                  icon: 'timer_icon.png',
                  onTap: () {},
                ),
                NavButtonWidget(
                  title: 'Stopwatch',
                  icon: 'stopwatch_icon.png',
                  onTap: () {},
                ),
              ],
            ),
          ),
          const VerticalDivider(
            color: Colors.white54,
            width: 1,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Text(
                      'Clock',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(formattedTime,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 64,
                                fontWeight: FontWeight.w300)),
                        Text(formattedDate,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w300)),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 4,
                    fit: FlexFit.tight,
                    child: Align(
                        child: ClockView(
                      size: MediaQuery.sizeOf(context).height / 3,
                    )),
                  ),
                  Flexible(
                    flex: 2,
                    fit: FlexFit.tight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Timezone',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Icon(
                              Icons.language,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 16),
                            Text('UTC$offsetSign$timezone',
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 20)),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
