import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/models/food.dart';
import 'package:sushi_app/models/shop.dart';
import 'package:sushi_app/theme/colors.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});
  void removeFromCart(Food food, BuildContext context) {
    final shop = context.read<Shop>();
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(builder: (context, value, child) => Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(backgroundColor: primaryColor,
        elevation: 0,
        title: Text('My Cart',
          style: TextStyle(color: Colors.white),),
        centerTitle: true,),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemCount: value.cart.length,
                itemBuilder: (context, index) {
              //get the food from cart
              final Food food = value.cart[index];
              //get food name
              final String foodName = food.name;
              //get food price
              final String foodPrice = food.price;
              //return list tile
              return Container(
                decoration: BoxDecoration(color: secondaryColor, borderRadius: BorderRadius.circular(8)),
                margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                child:
                    ListTile(
                      title: Text(foodName, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      subtitle: Text(foodPrice, style: TextStyle(color: Colors.grey[200]),),
                      trailing: IconButton(onPressed: () => removeFromCart(food, context), icon: Icon(Icons.delete, color: Colors.grey[300],)),
                    ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: MyButton(text: 'Pay now', onTap: () {}),
          )
        ],
      ),
    )
    );
  }
}
