import 'package:get/get.dart';
import '../../../apiservice/api_service.dart';
import '../../../model/product_model.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = true.obs;

  // For product details
  var selectedProduct = Rxn<Product>(); // Nullable Rx
  var isDetailLoading = false.obs;

  final ProductApiService apiService = ProductApiService.to;

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }


  void fetchProducts() async {
    try {
      isLoading(true);
      products.value = await apiService.fetchProducts();
    } catch (e) {
      print("Error fetching products: $e");
    } finally {
      isLoading(false);
    }
  }

}
