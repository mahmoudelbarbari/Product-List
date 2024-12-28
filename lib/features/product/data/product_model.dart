class ProductModel {
  final String name;
  final String description;
  final String image;
  final double price;

  ProductModel({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'] ?? 'Nameless Product',
      description: json['description'] ?? 'No description available.',
      image: json['image'] ?? '',
      price: json['price'] != null ? json['price'].toDouble() : 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'description': description,
    };
  }
}
