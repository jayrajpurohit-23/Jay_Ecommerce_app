import 'package:flutter/material.dart';
import '../models/product.dart';

class CartProvider extends ChangeNotifier {
  final Map<int, int> _cart = {};

  Map<int, int> get cart => _cart;

  int get totalItems =>
      _cart.values.fold(0, (sum, quantity) => sum + quantity);

  void addToCart(Product product) {
    _cart[product.id] = (_cart[product.id] ?? 0) + 1;
    notifyListeners();
  }

  void removeFromCart(Product product) {
    _cart.remove(product.id);
    notifyListeners();
  }

  void increaseQuantity(Product product) {
    addToCart(product);
  }

  void decreaseQuantity(Product product) {
    if (!_cart.containsKey(product.id)) return;

    if (_cart[product.id]! > 1) {
      _cart[product.id] = _cart[product.id]! - 1;
    } else {
      _cart.remove(product.id);
    }

    notifyListeners();
  }

  double getTotal(List<Product> products) {
    double total = 0;

    for (var product in products) {
      total += product.price * (_cart[product.id] ?? 0);
    }

    return total;
  }
}
