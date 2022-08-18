import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commers_user/helper/constans.dart';
import 'package:e_commers_user/provider/firestore_provider.dart';
import 'package:e_commers_user/views/widgets/category_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans;
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FirestoreProvider>(
      builder: (context, provider, child) {
        return WillPopScope(
          onWillPop: () async {
            return false;
          },
          child: Scaffold(
            backgroundColor: scafoldBackGround,
            appBar: AppBar(
              title: Text('Home'.tr()),
              backgroundColor: primaryColor,
              automaticallyImplyLeading: false,
              actions: [
                InkWell(
                    onTap: () {
                      if (context.locale.toString() == 'en') {
                        context.setLocale(const Locale('ar'));
                      } else {
                        context.setLocale(const Locale('en'));
                      }
                    },
                    child: const Icon(Icons.language)),
              ],
            ),
            body: SizedBox(
              height: Get.height,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                      ),
                      items: provider.photos
                          .map((e) => CachedNetworkImage(
                                imageUrl: e.url,
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  height: Get.height / 4,
                                  width: Get.width * 0.8,
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(15)),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Categories'.tr(),
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: Get.width * 0.9,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: provider.allCategories.length,
                          itemBuilder: ((context, index) {
                            return CategoryWidget(
                              category: provider.allCategories[index],
                            );
                          })),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
