import 'dart:developer';

import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:http/http.dart' as http;

import '../model/product_model.dart';
import '../resource/api_resource.dart';

class ProductController extends GetxController {
  Future<List<ProductModel>> getProduct() async {
    try {
      var response = await http.get(Uri.parse(APIRoute().products));
      if (response.statusCode == 200) {
        return productModelFromJson(response.body);
      } else {
        log(response.body.toString());
      }
    } catch (e) {
      log(e.toString());
    }
    return [];
  }
}
