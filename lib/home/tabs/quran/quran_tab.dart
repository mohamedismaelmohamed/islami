import 'package:flutter/material.dart';
import 'package:islami_online_c13/home/tabs/quran/sura_details_screen.dart';
import 'package:islami_online_c13/home/tabs/quran/sura_list_widget.dart';
import 'package:islami_online_c13/model/sura_model.dart';
import 'package:islami_online_c13/utils/app_colors.dart';
import 'package:islami_online_c13/utils/app_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTab extends StatefulWidget {
  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  void addSuraList() {
    for (int i = 0; i < 114; i++) {
      SuraModel.suraList.add(SuraModel(
          suraEnglishName: SuraModel.suraEnglishList[i],
          suraArabicName: SuraModel.suraArabicList[i],
          numOfVerses: SuraModel.numOfVersesList[i],
          fileName: '${i + 1}.txt'));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addSuraList();
    loadLastSura();

    /// get data in shared prefs.
  }

  List<SuraModel> filterList = SuraModel.suraList;

  /// 114
  String searchText = '';
  List<SuraModel> searchResultList = [];
  Map<String, String> loadSuraList = {};

  @override
  Widget build(BuildContext context) {
    // loadLastSura();
    return Container(
      margin: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(child: Image.asset('assets/images/logo.png')),
          TextField(
            style: TextStyle(color: AppColors.whiteColor),
            cursorColor: AppColors.whiteColor,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        color: AppColors.primaryDark, width: 2)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(
                        color: AppColors.primaryDark, width: 2)),
                prefixIcon: const ImageIcon(
                    color: AppColors.primaryDark,
                    AssetImage(
                      'assets/images/icon_search.png',
                    )),
                hintText: 'Sura Name',
                hintStyle: AppStyles.bold16White),
            onChanged: (text) {
              searchText = text;
              filterList = SuraModel.suraList.where((suraModel) {
                return suraModel.suraArabicName.contains(searchText) ||
                    suraModel.suraEnglishName
                        .toLowerCase()
                        .contains(searchText.toLowerCase());
              }).toList();
              setState(() {});
            },
          ),
          const SizedBox(
            height: 20,
          ),
          searchText.isNotEmpty ? SizedBox() : builtMostRecentlyWidget(),
          const SizedBox(
            height: 10,
          ),
          Text('Sura List', style: AppStyles.bold16White),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.separated(
            separatorBuilder: (context, index) {
              return const Divider(
                color: AppColors.whiteColor,
                thickness: 2,
                indent: 30.5,
                endIndent: 25.5,
              );
            },
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    // save last sura
                    saveLastSura(
                        suraEnName: filterList[index].suraEnglishName,
                        suraArName: filterList[index].suraArabicName,
                        numOfVerses: filterList[index].numOfVerses);
                    Navigator.of(context).pushNamed(SuraDetailsScreen.routeName,
                        arguments: filterList[index]);
                  },
                  child: SuraListWidget(
                    index: index,
                    suraModel: filterList[index],
                  ));
            },
            itemCount: filterList.length,
          ))
        ],
      ),
    );
  }

  Widget builtMostRecentlyWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Most Recently ',
          style: AppStyles.bold16White,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    loadSuraList['suraEnName'] ?? '',
                    style: AppStyles.bold24Black,
                  ),
                  Text(
                    loadSuraList['suraArName'] ?? '',
                    style: AppStyles.bold24Black,
                  ),
                  Text(
                    '${loadSuraList['numOfVerses']} Verses' ?? '',
                    style: AppStyles.bold14Black,
                  ),
                ],
              ),
              Image.asset('assets/images/most_recently_image.png')
            ],
          ),
        ),
      ],
    );
  }

  saveLastSura(
      {required String suraEnName,
      required String suraArName,
      required String numOfVerses}) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('suraEnName', suraEnName);
    await prefs.setString('suraArName', suraArName);
    await prefs.setString('numOfVerses', numOfVerses);
    await loadLastSura();
  }

  getLastSura() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String suraEnName = prefs.getString('suraEnName') ?? '';
    String suraArName = prefs.getString('suraArName') ?? '';
    String numOfVerses = prefs.getString('numOfVerses') ?? '';
    return {
      'suraEnName': suraEnName,
      'suraArName': suraArName,
      'numOfVerses': numOfVerses,
    };
  }

  /// get data from shared prefs
  loadLastSura() async {
    loadSuraList = await getLastSura();
    setState(() {});
  }
}
