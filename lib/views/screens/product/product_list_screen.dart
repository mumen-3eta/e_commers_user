import 'package:e_commers_user/helper/constans.dart';
import 'package:e_commers_user/helper/nav/nav_helper.dart';
import 'package:e_commers_user/models/category_model.dart';
import 'package:e_commers_user/provider/firestore_provider.dart';
import 'package:e_commers_user/views/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:get/get.dart' hide Trans;

class ProductListScreen extends StatelessWidget {
  CategoryModel category;
  ProductListScreen({required this.category});
  @override
  Widget build(BuildContext context) {
    return Consumer<FirestoreProvider>(
      builder: (context, provider, child) {
        return WillPopScope(
          onWillPop: () async {
            provider.resetProduct();
            return true;
          },
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: primaryColor,
              title: Text('Products'.tr()),
            ),
            backgroundColor: scafoldBackGround,
            body: Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                  child: SizedBox(
                width: Get.width * 0.9,
                height: Get.height,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: provider.products.length,
                    itemBuilder: ((context, index) {
                      return ProductWidget(
                        product: provider.products[index],
                        catId: category.catId,
                      );
                    })),
              )),
            ),
          ),
        );
      },
    );
  }
}
