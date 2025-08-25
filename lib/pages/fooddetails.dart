import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/models/food.dart';
import 'package:sushi_app/theme/colors.dart';
import 'package:sushi_app/models/shop.dart';


class FoodDetails extends StatefulWidget {
  final Food food;
  const FoodDetails({super.key, required this.food});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {

  int quantity = 0;

  // Increment quantity function
  void incrementQuantity() {
    setState(() {
      quantity++;

    });
  }

  // Decrement quantity function
  void decrementQuantity() {
    setState(() {
      if (quantity > 0){
        quantity--;
      }

    });
  }
  
  // Add to cart
  void addToCart() {
    //button won't function if the quantity is 0
    if (quantity > 0){
      //get access to the shop
      final shop = context.read<Shop>();
      //add to cart
      shop.addToCart(widget.food, quantity);
      //let the user know it was successful
      showDialog(barrierDismissible: false,
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: primaryColor,
            content: const Text("Added To Cart",
            style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
            actions: [
              IconButton(onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              }, icon: const Icon(Icons.done, color: Colors.white,))
            ],
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          Expanded(child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: ListView(
              children: [
                Image.asset(
                  widget.food.imagePath,
                  height: 200,
                ),
                SizedBox(height: 25),
                Row(
                  children: [
                    Icon(Icons.star,
                    color: Colors.yellow[800],),
                    SizedBox(width: 5),
                    Text(widget.food.rating,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                    ),),
                  ],
                ),
                SizedBox(height: 10),
                Text(widget.food.name, style: GoogleFonts.dmSerifDisplay(fontSize: 28),),
                SizedBox(height: 25),
                Text("Description", style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.bold, color: Colors.grey[900]),),
                SizedBox(height: 10),
                Text("Delicately sliced, fresh Atlantic Salmon drapes elegantly over a pillow of perfectly seasoned sushi rice. Its vibrant hue and buttery texture promise an exquisite melt-in-your-mouth experience that will leave you craving for more. Paired with a whisper of wasabi and a side of traditional pickled ginger, our salmon sushi is an ode to the purity and simplicity of authentic Japanese flavors. Indulge in the ocean's bounty with each savory bite",
                style: TextStyle(color: Colors.grey[600],
                height: 2,
                fontSize: 14),),
              ]
            ),
          )),
          Container(
            color: primaryColor,
            padding: EdgeInsets.all(25),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.food.price,
                    style: TextStyle(color: Colors.white,
    fontSize: 18, fontWeight: FontWeight.bold),),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(icon: Icon(Icons.remove, color: Colors.white,), onPressed: decrementQuantity)
                        ),
                        SizedBox(width: 40, child: Center(child: Text(quantity.toString(), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),))),
                        Container(
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            shape: BoxShape.circle,
                          ),
                            child: IconButton(icon: Icon(Icons.add, color: Colors.white,), onPressed: incrementQuantity)
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(height: 25),
                MyButton(text: 'Add to Cart', onTap: () => addToCart())
              ],
            ),
          )
        ],
      ),
    );
  }
}
