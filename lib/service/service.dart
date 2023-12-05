import 'package:shoping_cart/model/ProductModel.dart';
import 'package:http/http.dart' as http;

class Service {
  static Future<List<Product>> getAllProduct() async {
    http.Response response =
        await http.get(Uri.parse("https://fakestoreapi.com/products"));

    if (response.statusCode == 200) {
      return productFromJson(response.body);
    } else {
      return [];
    }
  }
}
