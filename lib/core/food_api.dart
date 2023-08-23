import 'package:dio/dio.dart';

import '../model/models.dart';

class FoodApi{
  final _dio = Dio(BaseOptions(baseUrl: 'https://run.mocky.io/v3/',
    validateStatus: (status) => true,));

  Future<List<Category>> getCategories() async {
    final response =  await _dio.get('1084bc88-24e4-4d5f-8b1e-e148136f157f');
    return (response.data['categories'] as List).map((e) => Category.fromJson(e)).toList();
  }

  Future<List<Product>> getQuery(String query) async {
    final response =  await _dio.get('1084bc88-24e4-4d5f-8b1e-e148136f157f');
    final categories = (response.data['categories'] as List).map((e) => Category.fromJson(e)).toList();
    final products = <Product>[];
    for(var category in categories){
      for(var product in category.products){
        if(product.title.uz.toLowerCase().contains(query)){
          products.add(product);
        }
      }
    }
    return products;
  }
}