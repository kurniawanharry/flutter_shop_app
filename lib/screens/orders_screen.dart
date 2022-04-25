import 'package:flutter/material.dart';
import 'package:flutter_shop_app/widgets/app_drawer.dart';
import '../widgets/orders_item.dart';
import 'package:provider/provider.dart';

import '../providers/orders.dart' show Orders;

class OrderScreen extends StatelessWidget {
  static const routeName = '/order';
  OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = context.watch<Orders>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(
        itemCount: orderData.order.length,
        itemBuilder: (context, index) =>
            OrderItem(orderItem: orderData.order[index]),
      ),
      drawer: AppDrawer(),
    );
  }
}
