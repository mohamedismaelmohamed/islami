import 'package:flutter/material.dart';
import 'package:islami_online_c13/utils/app_colors.dart';

import '../../../utils/my_theme_data.dart';

class RadioTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        "assets/images/",
        width: double.infinity,
        fit: BoxFit.fitWidth,
      ),
      Scaffold(
        body: Column(
          children: [
            Expanded(child: Image.asset("assets/images/radioIcon.png")),
            Text("إذاعة القرآن الكريم ",style:Theme.of(context).textTheme.bodyLarge,),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:  [
                  Icon(Icons.skip_previous,color: AppColors.primaryDark,size:60,),
                  Icon(Icons.play_arrow,color: AppColors.primaryDark,size:60,),
                  Icon(Icons.skip_next,color: AppColors.primaryDark,size:60,)
                ],
              ),
            )

          ],
        ),
      )
    ]);
  }
}


