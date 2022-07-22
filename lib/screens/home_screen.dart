import 'package:flutter/material.dart';

import '/data/data.dart';
import '/widgets/recent_orders.dart';
import '/widgets/nearby_restaurants.dart';
import '/screens/cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.account_circle_rounded),
        ),
        title: const Text('Food Delivery'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const CartScreen()),
              );
            },
            child: Text(
              'Cart(${currentUser.cart!.length})',
              style: const TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(width: 0.8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide(
                    width: 0.8,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.clear, color: Colors.grey),
                ),
                hintText: 'Search Food or Restaurants',
              ),
            ),
          ),

          // TODO: for Recent Orders
          const RecentOrders(),

          // TODO: for Nearby Restaurants
          const NearbyRestaurants(),
        ],
      ),
    );
  }
}


