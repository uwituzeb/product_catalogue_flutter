import 'package:flutter/material.dart';
import 'product.dart';
import 'package:get/get.dart';
import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Set initial theme to light
  bool isDarkMode = false;

  // List of products to display in catalog
  final List<Product> products = [
    Product(
      name: "Pizza",
      imageUrl: "https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c3VzaGl8ZW58MHx8MHx8fDA%3D",
      price: 12.99,
    ),
    Product(
      name: "Burger",
      imageUrl: "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2FsYWR8ZW58MHx8MHx8fDA%3D",
      price: 8.99,
    ),
    Product(
      name: "Sushi",
      imageUrl: "https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c3VzaGl8ZW58MHx8MHx8fDA%3D",
      price: 15.99,
    ),
    Product(
      name: "Salad",
      imageUrl: "https://images.unsplash.com/photo-1512621776951-a57141f2eefd?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2FsYWR8ZW58MHx8MHx8fDA%3D",
      price: 6.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Store',
      // Switches between dark and light themes
      theme: isDarkMode ? MyThemes.dark : MyThemes.light,
      home: CatalogPage(
        // toggles theme when button clicked
        toggleTheme: () {
          setState(() {
            isDarkMode = !isDarkMode;
          });
        },
        products: products,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CatalogPage extends StatelessWidget {
  final Function toggleTheme;
  final List<Product> products;

  const CatalogPage({super.key, required this.toggleTheme, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Food Store',
          style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              toggleTheme();
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, //display products in grid
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return GestureDetector(
            onTap: () {
              // Diplay dialogwith product details when tapped
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(product.name),
                  content: Text('Price: \$${product.price}'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            child: AnimatedContainer(
              duration: const Duration(seconds: 1),
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(product.name),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('\$${product.price}'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}