import 'package:flutter/material.dart';
import 'package:flutter_shop_app/providers/products_provider.dart';
import 'package:flutter_shop_app/widgets/app_drawer.dart';
import 'package:flutter_shop_app/widgets/user_product_item.dart';
import 'package:provider/provider.dart';

import '../screens/edit_product_screen.dart';

class UserProductSreen extends StatelessWidget {
  static const routeName = '/user-product';
  UserProductSreen({
    Key? key,
  }) : super(key: key);

  Future<void> _refreshCart(BuildContext context) async {
    await context.read<ProductsProvider>().fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final productData = context.watch<ProductsProvider>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(EditProductScreen.routeName);
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _refreshCart(context),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemBuilder: (_, index) => Column(
              children: [
                UserProductItem(
                  id: productData.items[index].id,
                  title: productData.items[index].title,
                  imageUrl: productData.items[index].imageUrl,
                ),
                Divider(),
              ],
            ),
            itemCount: productData.items.length,
          ),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
