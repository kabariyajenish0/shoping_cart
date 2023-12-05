import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_cart/controller/my_cart_controller.dart';
import 'package:shoping_cart/model/ProductModel.dart';

class MyCart extends StatelessWidget {
  MyCart({super.key});

  var myCartCtr = Get.find<MyCartCtr>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MyCart")),
      body: GetBuilder<MyCartCtr>(
        builder: (controller) => ListView.builder(
            itemBuilder: (context, index) {
              Product product = myCartCtr.myCart[index];
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
                trailing: IconButton(
                    icon: Icon(Icons.delete_outline),
                    onPressed: () => myCartCtr.removeCart(product)),
              );
            },
            itemCount: myCartCtr.myCart.length),
      ),
    );
  }
}
