import '../../data/product_model.dart';
import '../../data/product_service.dart';

class GetProductsUseCase {
  final ProductService productService;

  GetProductsUseCase(this.productService);

  Future<List<ProductModel>> execute() {
    return productService.fetchProducts();
  }
}
