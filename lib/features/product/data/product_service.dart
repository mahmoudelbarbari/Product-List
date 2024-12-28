import 'package:dio/dio.dart';
import 'product_model.dart';

class ProductService {
  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://api.escuelajs.co/api/v1/products',
  ));

  Future<List<ProductModel>> fetchProducts() async {
    try {
      final response = await _dio.get('');
      print('Raw Response: ${response.data}');

      if (response.statusCode == 200) {
        List<ProductModel> products = (response.data as List)
            .map((product) => ProductModel.fromJson(product))
            .toList();
        return products;
      } else {
        throw Exception(
            'Failed to load products, status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Failed to load products');
    }
  }
}
