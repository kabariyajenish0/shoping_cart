import 'package:get/get.dart';

import 'package:shoping_cart/service/service.dart';

import '../model/ProductModel.dart';

class MyCartCtr extends GetxController {
  late List<Product> products;
  List<Product> myCart = [];

  var isLoader = true;

  @override
  void onInit() {
    Service.getAllProduct().then((value) {
      products = value;
      isLoader = false;
      update();
    });
    super.onInit();
  }

  void addOrRemoveProducts(Product product) {
    myCart.contains(product) ? myCart.remove(product) : myCart.add(product);
    update();
  }

  void removeCart(Product product) {
    myCart.remove(product);
    update();
  }
}
