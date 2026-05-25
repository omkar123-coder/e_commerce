class CategoryModel {
  final String id;
  final String title;
  final String price;
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
      id: json['id'],
      title: json['title'],
      price: json['price'](),
      description: json['description'],
      image: json['image'],
    );
  }
}
