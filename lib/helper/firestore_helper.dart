import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commers_user/models/category_model.dart';
import 'package:e_commers_user/models/image_model.dart';
import 'package:e_commers_user/models/product_model.dart';

class FirestoreHelper {
  FirestoreHelper._();
  static FirestoreHelper firestoreHelper = FirestoreHelper._();
  CollectionReference<Map<String, dynamic>> categoryCollection =
      FirebaseFirestore.instance.collection('categories');

  CollectionReference<Map<String, dynamic>> imagesCollection =
      FirebaseFirestore.instance.collection('images');

  Future<List<CategoryModel>> getAllCategories() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await categoryCollection.get();
    return querySnapshot.docs.map((e) {
      CategoryModel category = CategoryModel.fromMap(e.data());
      category.catId = e.id;
      return category;
    }).toList();
  }

  Future<List<ProductModel>> getAllProducts(String catId) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('categories')
        .doc(catId)
        .collection('products')
        .get();
    return querySnapshot.docs.map((e) {
      ProductModel product = ProductModel.fromMap(e.data());
      product.id = e.id;
      return product;
    }).toList();
  }

  Future<List<ImageModel>> getAllImages() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await imagesCollection.get();
    return querySnapshot.docs.map((e) {
      ImageModel image = ImageModel.fromMap(e.data());
      image.id = e.id;
      return image;
    }).toList();
  }
}
