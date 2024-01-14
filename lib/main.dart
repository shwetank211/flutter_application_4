import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'product_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: MaterialApp(
        title: 'E-Commerce App',
        theme: ThemeData(
          primarySwatch: Colors.teal, // Choose a primary color
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Roboto', // Choose an appropriate font
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => ProductListScreen(),
          '/cart': (context) => CartScreen(),
        },
      ),
    );
  }
}


class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    // ... (unchanged)
    Product(image: 'assets/i.jpeg', name: 'iPhone', price: 1999.99),
    Product(image: 'assets/i2.jpeg', name: 'Samsung', price: 999.99),
    Product(image: 'assets/i3.jpeg', name: 'Huawei', price: 799.99),
    Product(image: 'assets/i4.jpeg', name: 'Xiaomi', price: 699.99),
    Product(image: 'assets/i6.jpeg', name: 'Vivo', price: 499.99),
    Product(image: 'assets/i7.jpeg', name: 'Realme', price: 299.99),
    Product(image: 'assets/i8.jpeg', name: 'OnePlus', price: 899.99),
    Product(image: 'assets/i9.jpeg', name: 'Google', price: 799.99),
    Product(image: 'assets/i10.jpeg', name: 'Sony', price: 399.99),
   
    // Add more products here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'E-Commerce App',
          style: TextStyle(
            fontFamily: 'Raleway', // Choose an appropriate font
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
        backgroundColor: Colors.teal, // Choose a primary color
      ),
      body: Container(
        color: Colors.grey[200], // Choose a background color
        child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4.0,
              margin: EdgeInsets.all(8.0),
              color: Colors.white, // Card background color
              child: ProductItem(product: products[index]),
            );
          },
        ),
      ),
    );
  }
}


class ProductItem extends StatelessWidget {
  final Product product;

  ProductItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Container(
          width: 60.0,
          height: 60.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: AssetImage(product.image),
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(
          product.name,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
        trailing: Consumer<CartProvider>(
          builder: (context, cart, child) {
            bool isInCart = cart.cartItems.contains(product);
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: isInCart
                      ? Icon(Icons.check, color: Colors.green)
                      : Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    if (isInCart) {
                      cart.removeFromCart(product);
                    } else {
                      cart.addToCart(product);
                    }
                  },
                ),
                if (isInCart)
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      cart.removeFromCart(product);
                    },
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Shopping Cart',
          style: TextStyle(
            fontFamily: 'Montserrat', // Choose an appropriate font
          ),
        ),
        backgroundColor: Colors.deepOrange, // Choose a primary color
      ),
      body: ListView.builder(
        itemCount: cartProvider.cartItems.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4.0,
            margin: EdgeInsets.all(8.0),
            color: Colors.white, // Card background color
            child: ListTile(
              leading: Container(
                width: 60.0,
                height: 60.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: AssetImage(cartProvider.cartItems[index].image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                cartProvider.cartItems[index].name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              subtitle: Text(
                '\$${cartProvider.cartItems[index].price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Total: \$${cartProvider.totalPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                cartProvider.clearCart();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange, // Button background color
              ),
              child: Text(
                'BUY',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
