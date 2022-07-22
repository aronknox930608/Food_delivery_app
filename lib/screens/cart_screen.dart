import 'package:flutter/material.dart';
import 'package:food_delivery_app_ui/models/order.dart';

import '/data/data.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  Widget _buildCartItem(BuildContext context, Order order) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      height: 170.0,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        children: <Widget>[
          Container(
            width: 150.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(order.food!.imageUrl!),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    order.food!.name!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    order.restaurant!.name!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    height: 30.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.0),
                      border: Border.all(color: Colors.black, width: 0.5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            '-',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                        Text(
                          order.quantity.toString(),
                          style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            '+',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              '\$${order.food!.price}',
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    currentUser.cart!.forEach((Order thisOrder) {
      totalPrice += thisOrder.quantity! * thisOrder.food!.price!;
    });
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        centerTitle: true,
        title: Text(
          'Cart(${currentUser.cart!.length})',
          style: const TextStyle(color: Colors.white, fontSize: 20.0),
        ),
      ),
      body: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          if(index < currentUser.cart!.length) {
            Order order = currentUser.cart![index];
            return _buildCartItem(context, order);
          }
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const <Widget>[
                    Text(
                      'Estimated Delivery Time:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '20 min',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Total Cost:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '\$${totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.green.shade700,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 85.0),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
        itemCount: currentUser.cart!.length + 1,
      ),
      bottomSheet: Container(
        height: 80.0,
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: const <BoxShadow>[
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, -1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: const Text(
          'CHECKOUT',
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
