import 'package:flutter/material.dart';
import 'package:flutter_shop_app/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductsDetail extends StatelessWidget {
  static const routeName = '/products-detail';
  ProductsDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedDetail = context.read<ProductsProvider>().FindById(productsId);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedDetail.title),
      ),
      body: Center(child: Text('Aye!')),
    );
  }
}
