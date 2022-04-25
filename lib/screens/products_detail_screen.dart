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
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              loadedDetail.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '\$${loadedDetail.price}',
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            width: double.infinity,
            child: Text(
              '${loadedDetail.description}',
              textAlign: TextAlign.center,
              softWrap: true,
            ),
          )
        ]),
      ),
    );
  }
}
