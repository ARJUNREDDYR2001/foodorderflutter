// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'food_details.dart';

class FoodListPage extends StatelessWidget {
  final List<FoodItemDetails> foodItems = [
    FoodItemDetails(
      name: "Biriyani",
      image:"assets/biriyani.jpeg",
      description: "A spiced mix of meat and rice, traditionally cooked over an open fire in a leather pot..",
      price: "Rs.100",
    ),
    FoodItemDetails(
      name: "rice",
      image: 'assets/rice.jpg',
      description: "Sambar rice is a dish made with lentils, rice, mixed vegetables, spices & herbs.",
      price: "Rs. 200",
    ),
    FoodItemDetails(
      name: "ragiball",
      image: 'assets/ragiball.jpg',
      description: "Ragi Mudde are healthy balls made from finger millet flour and water.",
      price: "Rs. 300",
    ),
     FoodItemDetails(
      name: "Dosa",
      image: 'assets/Dosa.jpg',
      description: "A dosa is a thin savory pancake in South Indian cuisine made from a fermented batter of ground black lentils and rice.",
      price: "Rs. 200",
    ),
     FoodItemDetails(
      name: "Idli",
      image: 'assets/Idli.jpg',
      description: " Idli is a healthy breakfast that is served with delicious coconut chutney and sambar.",
      price: "Rs. 200",
    ),
     FoodItemDetails(
      name: "chitranna",
      image: 'assets/chitranna.jpg',
      description: "A cheesy pizza with your favorite toppings.",
      price: "Rs. 100",
    ),
     FoodItemDetails(
      name: "chapathi",
      image: 'assets/chapathi.jpg',
      description: "Chitranna is a rice-based dish widely prepared in South India. ",
      price: "Rs. 50",
    ),
     FoodItemDetails(
      name: "poori",
      image: 'assets/poori.jpeg',
      description: "Puri  is a deep-fried bread made from unleavened whole-wheat flour that originated in the Indian subcontinent.",
      price: "Rs. 70",
    ),
    FoodItemDetails(
      name: "gobi",
      image: 'assets/gobi.jpg',
      description: "A cheesy pizza with your favorite toppings.",
      price: "Rs. 20",
    ),
    FoodItemDetails(
      name: "Veg-Biryani",
      image: 'assets/Veg-Biryani.jpg',
      description: "A cheesy pizza with your favorite toppings.",
      price: "Rs. 100",
    ),
    FoodItemDetails(
      name: "mushroomrice",
      image: 'assets/mushroomrice.jpg',
      description: "A cheesy pizza with your favorite toppings.",
      price: "Rs. 250",
    ),
    FoodItemDetails(
      name: "Pizza",
      image: 'assets/Pizza.jpg',
      description: "A cheesy pizza with your favorite toppings.",
      price: "Rs. 400",
    ),
    FoodItemDetails(
      name: "Chow-Chow-Bath",
      image: 'assets/Chow-Chow-Bath-Recipe.jpg',
      description: "A cheesy pizza with your favorite toppings.",
      price: "Rs. 200",
    ),
    FoodItemDetails(
      name: "parota",
      image: 'assets/parota.jpg',
      description: "A cheesy pizza with your favorite toppings.",
      price: "Rs. 70",
    ),
    FoodItemDetails(
      name: "paneer",
      image: 'assets/paneer.jpg',
      description: "A cheesy pizza with your favorite toppings.",
      price: "Rs. 80",
    ),
    FoodItemDetails(
      name: "fishfry",
      image: 'assets/fishfry.jpg',
      description: "A cheesy pizza with your favorite toppings.",
      price: "Rs. 130",
    ),

    // Add more FoodItemDetails instances here
  ];

   FoodListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 13, 206, 77),
        title: Text("Food List"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/'); // Navigate back to the home page
          },
        ),
      ),
     
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 1,
          crossAxisSpacing: 1,
        ),
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FoodDetailsPage(foodItem: foodItems[index]),
                ),
              );
            },
            child: Card(
              child: Column(
                children: [
                  Container(
        width: double.infinity,
        height: 135, // Adjust the height as needed
        child: Image.asset(
          foodItems[index].image,
          fit: BoxFit.cover,
        ),
        ),
                   Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      foodItems[index].name,
                      style: TextStyle(
                        fontSize: 20, // Adjust the font size as needed
                        fontWeight: FontWeight.bold,
                  ),
                    ),
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
