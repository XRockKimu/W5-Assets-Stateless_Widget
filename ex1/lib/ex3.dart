import 'package:flutter/material.dart';

// ---------- ENUM ----------
enum Product {
  dart(
    title: 'Dart',
    description: 'the best object language',
    image: 'assets/ex3/dart.png',
  ),
  flutter(
    title: 'Flutter',
    description: 'the best mobile widget library',
    image: 'assets/ex3/firebase.png',
  ),
  firebase(
    title: 'Firebase',
    description: 'the best cloud database',
    image: 'assets/ex3/flutter.png',
  );

  final String title;
  final String description;
  final String image;

  const Product({
    required this.title,
    required this.description,
    required this.image,
  });
}

// ---------- MAIN APP ----------
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Products',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProductCard(product: Product.dart),
              SizedBox(height: 10),
              ProductCard(product: Product.flutter),
              SizedBox(height: 10),
              ProductCard(product: Product.firebase),
            ],
          ),
        ),
      ),
    );
  }
}

// ---------- PRODUCT CARD WIDGET ----------
class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue.shade50,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              product.image,
              height: 80,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            Text(
              product.title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              product.description,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
