class CategoryModel {
  final int id;
  final String title;
  final double price;
  final String description;
  final String image;

  CategoryModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as int,
      title: json['title'] ?? '',
      price: (json['price'] as num).toDouble(),
      description: json['description'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
