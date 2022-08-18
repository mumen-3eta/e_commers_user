import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commers_user/helper/constans.dart';
import 'package:e_commers_user/helper/nav/nav_helper.dart';
import 'package:e_commers_user/models/category_model.dart';
import 'package:e_commers_user/provider/firestore_provider.dart';
import 'package:e_commers_user/views/screens/product/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans;

class CategoryWidget extends StatelessWidget {
  CategoryModel category;
  CategoryWidget({required this.category});
  @override
  Widget build(BuildContext context) {
    return Consumer<FirestoreProvider>(
      builder: (context, provider, child) {
        return InkWell(
          onTap: () {
            provider.getAllProducts(category.catId);
            NavHelper.navigateToWidget(ProductListScreen(category: category));
          },
          child: Container(
            height: Get.height / 3.5,
            width: Get.width * 0.9,
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: backGroundColor,
                border: Border.all(color: primaryColor),
                borderRadius: BorderRadius.circular(4)),
            child: Column(children: [
              CachedNetworkImage(
                imageUrl: category.imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  height: Get.height / 5,
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) => const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    )),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                      context.locale.toString() == 'en'
                          ? category.nameEn
                          : category.nameAr,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: fontColor.withOpacity(.5))),
                ],
              ),
            ]),
          ),
        );
      },
    );
  }
}
