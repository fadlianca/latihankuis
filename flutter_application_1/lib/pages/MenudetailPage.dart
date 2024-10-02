import 'package:flutter/material.dart';

class MenuDetailPage extends StatelessWidget {
  final String name;
  final String category;
  final String description;
  final String ingredients;
  final String cookingTime;
  final String price;
  final List<String> imageUrls;

  const MenuDetailPage({
    Key? key,
    required this.name,
    required this.category,
    required this.description,
    required this.ingredients,
    required this.cookingTime,
    required this.price,
    required this.imageUrls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrls[0]),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Category: $category",
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text("Description: $description"),
                  const SizedBox(height: 8),
                  Text("Ingredients: $ingredients"),
                  const SizedBox(height: 8),
                  Text("Cooking Time: $cookingTime"),
                  const SizedBox(height: 8),
                  Text("Price: $price"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
