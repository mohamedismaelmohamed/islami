
import 'package:flutter/material.dart';
import 'package:islami_online_c13/home/tabs/radio/radio_container.dart';
import 'package:islami_online_c13/home/tabs/radio/reciters_container.dart';
import 'package:islami_online_c13/utils/app_colors.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            ToggleSwitch(
              minWidth: 185,
              minHeight: 40.0,
              fontSize: 16.0,
              initialLabelIndex: currentIndex,
              activeBgColor:  [AppColors.primaryDark],
              activeFgColor: AppColors.blackColor,
              inactiveBgColor: AppColors.blackBgColor,
              inactiveFgColor: AppColors.whiteColor,
              totalSwitches: 2,
              labels: const [
                'Radio',
                'Reciters',
              ],
              onToggle: (index) {
                setState(() {
                  if (index == 0) {
                    currentIndex = 0;
                  }
                  if (index == 1) {
                    currentIndex += 1;
                  }
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            currentIndex == 1 ?  RecitersContainer() :  RadioContainer(),
          ],
        ),
      ),
    );
  }
}
