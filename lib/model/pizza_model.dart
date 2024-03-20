class Pizza {
  final String name;
  final String price;
  final String description;
  final String image;

  Pizza(
      {required this.name,
      required this.price,
      required this.description,
      required this.image});

  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      name: json['name'] as String,
      price: json['price'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['description'] = description;
    data['image'] = image;
    return data;
  }
}
