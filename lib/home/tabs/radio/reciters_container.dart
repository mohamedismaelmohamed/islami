
import 'package:flutter/material.dart';
import 'package:islami_online_c13/utils/app_colors.dart';
import 'package:islami_online_c13/utils/app_styles.dart';

class RecitersContainer extends StatelessWidget {
  RecitersContainer({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) => const SizedBox(
            height: 8,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return index == 1
                ? Container(
              height: size.height * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.primaryDark,
                image: const DecorationImage(
                    alignment: Alignment.bottomCenter,
                    opacity: .5,
                    image: AssetImage('assets/images/soundWave 1.png'),
                    fit: BoxFit.contain),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    getNameList[index],
                    style: AppStyles.bold20black,
                  ),
                  Image.asset(
                    'assets/images/radioPlay.png',
                  ),
                ],
              ),
            )
                : Container(
              height: size.height * 0.15,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                    image: AssetImage('assets/images/radioCard.png'),
                    fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    getNameList[index],
                    style:AppStyles.bold20black,
                  ),
                  Image.asset(
                    index == 2 || index == 3
                        ? 'assets/images/radioPlay2.png'
                        : 'assets/images/radioPlay.png',
                  ),
                ],
              ),
            );
          }),
    );
  }

  final List<String> getNameList =
  [
    'Ibrahim Al-Akdar',
    'Akram Alalaqmi',
    'Majed Al-Enezi',
    "Malik shaibat Alhamed"
  ];
}
