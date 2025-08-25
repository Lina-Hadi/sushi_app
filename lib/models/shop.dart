import 'package:sushi_app/models/food.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  // "_" to make the variables private
  final List<Food> _foodMenu = [
    Food(name: 'Salmon Sushi',
        price: '\$25.00',
        imagePath: 'assets/sushi-3.png',
        rating: '4.9'),
    Food(name: 'Tuna',
        price: '\$23.00',
        imagePath: 'assets/sushi-6.png',
        rating: '4.3'),
  ];

  final List<Food> _cart = [];

  List<Food> get foodMenu => _foodMenu;

  List<Food> get cart => _cart;

  void addToCart(Food foodItem, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  void removeFromCart(Food food) {
    _cart.remove(food);
    notifyListeners();
  }
}