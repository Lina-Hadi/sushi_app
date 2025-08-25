import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/components/button.dart';
import 'package:sushi_app/models/food.dart';
import 'package:sushi_app/models/shop.dart';
import 'package:sushi_app/theme/colors.dart';
import 'package:sushi_app/components/foodtile.dart';
import 'package:sushi_app/pages/fooddetails.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

//navigate to details page
void navigateToDetails(int index, BuildContext context) {
  final shop = context.read<Shop>();
  final foodMenu = shop.foodMenu;
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => FoodDetails(food: foodMenu[index],)
      )
  );
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Icon(Icons.menu,
        color: Colors.grey[900]),
        title: Text("Tokyo", style: TextStyle(color: Colors.grey[900])),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            Navigator.pushNamed(context, '/cart');
          }, icon: Icon(Icons.shopping_cart)),
        ],),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              //promo banner
              Container(
                decoration: BoxDecoration(color: primaryColor, borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.symmetric(horizontal: 25.0),
                  padding: EdgeInsets.symmetric(horizontal: 35, vertical: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //banner message
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text('Get 32% Promo',
                            style: GoogleFonts.dmSerifDisplay(
                              fontSize: 20,
                              color: Colors.white
                            )),
                           const SizedBox(height: 20),
                           //redeem button
                           MyButton(text: 'Redeem', onTap: () {}
                           ),
                         ],
                       ),
                      SizedBox(width: 50),
                      Image(image: AssetImage('assets/sushi-2.png'), height: 100,)
                    ],
                  )),
            ],
          ),
          SizedBox(height: 25),
          //search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white), borderRadius: BorderRadius.circular(20)), enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white), borderRadius: BorderRadius.circular(20)), hintText: "Search here..."),
            ),
          ),
          SizedBox(height: 25),
          //menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text('Food Menu',
            style: TextStyle(fontWeight: FontWeight.bold,
            color: Colors.grey[800],
            fontSize: 18),),
          ),
          SizedBox(height: 10),
          //popular food
          Expanded(child: ListView.builder(scrollDirection: Axis.horizontal, itemCount: foodMenu.length, itemBuilder: (context, index) => FoodTile(food: foodMenu[index], onTap: () => navigateToDetails(index, context),)
          )),
          SizedBox(height: 25),
          //popular food
          Container(
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.only(bottom: 25, left: 24, right: 25),
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image(image: AssetImage('assets/sushi-5.png'),
                    height: 60),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Salmon Eggs',
                        style: GoogleFonts.dmSerifDisplay(fontSize: 18),),
                        Text('\$ 21.00',
                        style: GoogleFonts.dmSerifDisplay(fontSize: 10),)
                      ],
                    ),
                  ],
                ),
                Icon(Icons.favorite_outline, color: Colors.grey, size: 28,)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

