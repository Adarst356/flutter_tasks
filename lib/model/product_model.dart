class Product {
  final int id;
  final String title;
  final String description;
  final List<String> images;
  final String returnPolicy;
  final int minimumOrderQuantity;
  final String qrCode;
  final int stock;
  final double rating;
  final String date;
  final double price;
  final String barcode;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.images,
    required this.returnPolicy,
    required this.minimumOrderQuantity,
    required this.qrCode,
    required this.stock,
    required this.rating,
    required this.date,
    required this.price,
    required this.barcode,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      images: List<String>.from(json['images'] ?? []),
      returnPolicy: json['returnPolicy'] ?? '7 Days Replacement',
      minimumOrderQuantity: json['minimumOrderQuantity'] ?? 1,
      qrCode: json['meta']?['qrCode'] ?? '',
      stock: json['stock'] ?? 0,
      rating: (json['rating'] != null) ? double.parse(json['rating'].toString()) : 0.0,
      date: json['meta']?['createdAt'] ?? '',
      price: (json['price'] != null) ? double.parse(json['price'].toString()) : 0.0,
      barcode: json['barcode'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "images": images,
      "returnPolicy": returnPolicy,
      "minimumOrderQuantity": minimumOrderQuantity,
      "qrCode": qrCode,
      "stock": stock,
      "rating": rating,
      "date": date,
      "price": price,
      "barcode": barcode,
    };
  }

  String get thumbnail => images.isNotEmpty ? images.first : 'https://via.placeholder.com/150';
}
