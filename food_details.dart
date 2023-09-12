// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class FoodDetailsPage extends StatelessWidget {
  final FoodItemDetails foodItem;

  FoodDetailsPage({required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 233, 66, 122),
        title: Text("Food Details"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            foodItem.image,
            width: 400,
            height: 400,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 20),
          Text(
            foodItem.name,
            style: TextStyle(fontSize: 40, color:Colors.purple,fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            foodItem.description,
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 45, 16, 205)
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
             Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(
      foodItem.price,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    SizedBox(width: 50),
    ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Alert"),
              content: Text("Item added to cart!"),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the alert dialog
                  },
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        textStyle: TextStyle(fontSize: 20),
      ),
      child: Text("Add to Cart"),
    ),
  ],
),
SizedBox(height: 10), // Add space between the two rows
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OrderPage(),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange,
        
        padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
        textStyle: TextStyle(fontSize: 30),
      ),
      child: Text("Order"),
    ),
  ],
),

        ],
      ),
    );
  }
}

class FoodItemDetails {
  final String name;
  final String image;
  final String description;
  final String price;

  FoodItemDetails({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });
}

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Place Order"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Name"),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: "Phone Number"),
               
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: "email"),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(labelText: "Address"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Alert"),
            content: Text("Order Placed!"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the alert dialog
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    },
    child: Text("Place Order"),
  ),
],
          
        ),
      ),
    );
  }
}
