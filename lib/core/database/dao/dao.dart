import 'package:floor/floor.dart';

import '../entity/entity.dart';


@dao
abstract class ProductDao {
  @Query('SELECT * FROM ProductData')
  Future<List<ProductData>> getAllProducts();

  @Query('SELECT * FROM ProductData WHERE productId = :id')
  Stream<ProductData?> findProductById(String id);

  @Query('SELECT * FROM ProductData')
  Stream<List<ProductData>> streamedData();

  @insert
  Future<void> insertProduct(ProductData product);

  @Query('DELETE FROM ProductData where productId = :id')
  Future<void> deleteProduct(String id);

  @Query('DELETE FROM ProductData')
  Future<void> deleteProducts();
}