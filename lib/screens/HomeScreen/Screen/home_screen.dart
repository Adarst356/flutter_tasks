import 'package:flutter/material.dart';
import 'package:flutter_tasks/screens/HomeScreen/Screen/product_details.dart';
import 'package:get/get.dart';
import '../controller/product_Controller.dart';

class HomeScreen extends StatelessWidget {
  final ProductController controller = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    int crossAxisCount = width >= 1200
        ? 5
        : width >= 900
        ? 4
        : width >= 600
        ? 3
        : 2;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        centerTitle: true,
        elevation: 2,
        backgroundColor: const Color(0xFF9BE55D),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return GridView.builder(
          padding: const EdgeInsets.all(12),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 0.65,
          ),
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final product = controller.products[index];

            return GestureDetector(
              onTap: () {
                // Navigate to product details
                Get.to(() => ProductDetailScreen(product: product));
              },
              child: Card(
                elevation: 6,
                shadowColor: Colors.black26,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
                      child: Image.network(
                        product.thumbnail,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // Details
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            product.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),

                          const SizedBox(height: 6),

                          // Price
                          Text(
                            "\$${product.price.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.green,
                            ),
                          ),

                          const SizedBox(height: 6),

                          // Rating stars
                          Row(
                            children: List.generate(5, (i) {
                              if (i < product.rating.round()) {
                                return const Icon(Icons.star, size: 18, color: Colors.amber);
                              } else {
                                return const Icon(Icons.star_border, size: 18, color: Colors.grey);
                              }
                            }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
