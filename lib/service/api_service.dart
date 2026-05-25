import 'dart:convert';
import 'dart:developer';
import 'package:e_commerce/models/category_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static String url = 'https://fakestoreapi.com/products';
  static Future<List<CategoryModel>> fetchProduct() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        log(response.body.toString());
        return data.map((e) => CategoryModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to fetch Products');
      }
    } catch (e) {
      log('Network error: $e');
      throw Exception('failed to fetch products');
    }
  }
}
