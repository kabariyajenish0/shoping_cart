import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoping_cart/controller/my_cart_controller.dart';
import 'package:shoping_cart/model/ProductModel.dart';
import 'package:shoping_cart/view/my_cart.dart';

import '../controller/fevorite_controller.dart';
import 'my_fevorite.dart';

class Home extends StatelessWidget {
  Home({super.key});

  var myCartCtr = Get.put(MyCartCtr());
  var myFevoriteCtr = Get.put(MyFevoriteCtr());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Products"), actions: [
        IconButton(
            onPressed: () {
              print(myCartCtr.myCart.length);
              Get.to(myFevorite());
            },
            icon: Icon(Icons.favorite)),
        IconButton(
            onPressed: () {
              print(myCartCtr.myCart.length);
              Get.to(MyCart());
            },
            icon: Icon(Icons.shopping_cart)),
      ]),
      body: GetBuilder<MyCartCtr>(
        builder: (controller) => myCartCtr.isLoader
            ? Center(child: CupertinoActivityIndicator())
            : ListView.builder(
                itemBuilder: (context, index) {
                  Product product = myCartCtr.products[index];
                  return ListTile(
                      leading: SizedBox(
                        width: 60,
                        height: 60,
                        child: Card(
                            elevation: 10,
                            child: Image.network(
                              "${product.image}",
                              fit: BoxFit.cover,
                            )),
                      ),
                      title: Text("${product.title}",
                          overflow: TextOverflow.ellipsis, maxLines: 1),
                      subtitle: Text("Price:\$${product.price}"),
                      trailing: Wrap(
                        children: [
                          GetBuilder<MyCartCtr>(
                            builder: (controller) => IconButton(
                                color: myCartCtr.myCart.contains(product)
                                    ? Colors.deepPurple
                                    : Colors.grey,
                                icon: Icon(Icons.shopping_cart_checkout),
                                onPressed: () =>
                                    myCartCtr.addOrRemoveProducts(product)),
                          ),
                          GetBuilder<MyFevoriteCtr>(
                            builder: (controller) => IconButton(
                                onPressed: () =>
                                    myFevoriteCtr.addOrRemoveProducts(product),
                                color:
                                    myFevoriteCtr.myFevorite.contains(product)
                                        ? Colors.red
                                        : Colors.grey,
                                icon: Icon(Icons.favorite_border)),
                          ),
                        ],
                      ));
                },
                itemCount: myCartCtr.products.length),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // Get.snackbar("title", "message",
        //     backgroundColor: Colors.white, snackPosition: SnackPosition.BOTTOM);

        // Get.defaultDialog(
        //     title: "Hello",
        //     middleText: "efaedf",
        //     barrierDismissible: false,
        //     confirm: TextButton(
        //         onPressed: () {
        //           Get.back();
        //         },
        //         child: Text("Ok")));
      }),
    );
  }
}
