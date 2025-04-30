
import 'package:flutter/material.dart';

import '../../../utils/app_styles.dart';

class TimeTab extends StatelessWidget {
  const TimeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(


          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo.png'),
            const SizedBox(height: 16,),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: const Color(0xff856B3F)
              ),
              child: Image.asset('assets/images/prayTimes.png' , fit: BoxFit.cover,),
            ),
            const SizedBox(height: 16,),
            Row(
              children: [
                Text('   Azkar' , style:AppStyles.White14,),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/eveningAzkar.png' , fit: BoxFit.cover,),
                  Image.asset('assets/images/morningAzkar.png' , fit: BoxFit.cover,),
                ]
            )
          ],
        ),
    );
  }
}