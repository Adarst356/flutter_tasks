import 'package:get/get.dart';
import '../model/product_model.dart';

class ProductApiService extends GetConnect {
  static ProductApiService get to => Get.find();

  @override
  void onInit() {
    httpClient.baseUrl = "https://dummyjson.com";
    httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(seconds: 30);
    super.onInit();
  }

  Future<List<Product>> fetchProducts() async {
    final response = await get("/products");
    if (response.status.hasError || response.body == null) {
      throw Exception("Failed to load products: ${response.statusText}");
    }

    final data = response.body['products'] as List;
    return data.map((e) => Product.fromJson(e)).toList();
  }
}
