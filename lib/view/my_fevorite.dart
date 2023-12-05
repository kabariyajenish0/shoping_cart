import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shoping_cart/model/ProductModel.dart';

import '../controller/fevorite_controller.dart';

class myFevorite extends StatelessWidget {
  myFevorite({super.key});

  var MyFevorite = Get.find<MyFevoriteCtr>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("myFevorite")),
      body: GetBuilder<MyFevoriteCtr>(
        builder: (controller) => ListView.builder(
            itemBuilder: (context, index) {
              Product product = MyFevorite.myFevorite[index];
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
                    onPressed: () => MyFevorite.removeCart(product)),
              );
            },
            itemCount: MyFevorite.myFevorite.length),
      ),
    );
  }
}
