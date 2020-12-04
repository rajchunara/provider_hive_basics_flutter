import 'package:flutter/material.dart';
import 'package:provider_hive/product.dart';

class ProductData extends ChangeNotifier {
  List<Product> productList = [
    Product(productName: 'iPhone', price: 786.0),
    Product(productName: 'iPad pro', price: 1099.0)
  ];

  void addProduct(Product product) {
    productList.add(product);

    notifyListeners();
  }

  void removeProduct() {
    productList.removeLast();
    notifyListeners();
  }

  List<Product> getAllProducts() {
    return productList;
  }
}
