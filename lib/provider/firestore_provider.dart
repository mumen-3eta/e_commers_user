import 'dart:io';

import 'package:e_commers_user/helper/firestore_helper.dart';
import 'package:e_commers_user/models/category_model.dart';
import 'package:e_commers_user/models/image_model.dart';
import 'package:e_commers_user/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class FirestoreProvider extends ChangeNotifier {
  GlobalKey<FormState> categoryKey = GlobalKey<FormState>();
  TextEditingController categoryNameArController = TextEditingController();
  TextEditingController categoryNameEnController = TextEditingController();
  File? selectedImage;
  String? selectedImageUrl;
  List<CategoryModel> allCategories = [];

  FirestoreProvider() {
    getAllCategories();
    getAllImages();
  }

  String? nullValidation(String? v) {
    if (v == null || v.isEmpty) {
      return 'this field is required';
    }
    return null;
  }

  resetCategory() {
    selectedImage = null;
    selectedImageUrl = null;
    categoryNameArController.clear();
    categoryNameEnController.clear();
  }

  getAllCategories() async {
    allCategories = await FirestoreHelper.firestoreHelper.getAllCategories();
    notifyListeners();
  }

  GlobalKey<FormState> productKey = GlobalKey<FormState>();
  TextEditingController productNameArController = TextEditingController();
  TextEditingController productNameEnController = TextEditingController();
  TextEditingController productDescriptionArController =
      TextEditingController();
  TextEditingController productDescriptionEnController =
      TextEditingController();
  TextEditingController productPriceController = TextEditingController();
  TextEditingController productQuantityController = TextEditingController();
  List<ProductModel> products = [];

  resetProduct() {
    selectedImage = null;
    selectedImageUrl = null;
    products.clear();
    productNameArController.clear();
    productNameEnController.clear();
    productDescriptionArController.clear();
    productDescriptionEnController.clear();
    productPriceController.clear();
    productQuantityController.clear();
  }

  resetProductWithoutList() {
    selectedImage = null;
    selectedImageUrl = null;
    productNameArController.clear();
    productNameEnController.clear();
    productDescriptionArController.clear();
    productDescriptionEnController.clear();
    productPriceController.clear();
    productQuantityController.clear();
  }

  getAllProducts(String catId) async {
    products = await FirestoreHelper.firestoreHelper.getAllProducts(catId);
    notifyListeners();
  }

  List<ImageModel> photos = [];

  getAllImages() async {
    photos = await FirestoreHelper.firestoreHelper.getAllImages();
    notifyListeners();
  }
}
