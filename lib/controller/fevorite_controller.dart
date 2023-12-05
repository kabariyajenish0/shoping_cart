import 'package:get/get.dart';

import 'package:shoping_cart/service/service.dart';

import '../model/ProductModel.dart';

class MyFevoriteCtr extends GetxController {
  late List<Product> products;
  List<Product> myFevorite = [];

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
    myFevorite.contains(product)
        ? myFevorite.remove(product)
        : myFevorite.add(product);
    update();
  }

  void removeCart(Product product) {
    myFevorite.remove(product);
    update();
  }
}
