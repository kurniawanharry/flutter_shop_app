import 'package:flutter/material.dart';
import 'package:flutter_shop_app/providers/auth.dart';
import 'package:flutter_shop_app/providers/orders.dart';
import 'package:flutter_shop_app/providers/products.dart';
import 'package:flutter_shop_app/screens/auth_screen.dart';
import 'package:flutter_shop_app/screens/cart_screen.dart';
import 'package:flutter_shop_app/screens/edit_product_screen.dart';
import 'package:flutter_shop_app/screens/orders_screen.dart';
import 'package:flutter_shop_app/screens/products_detail_screen.dart';
import 'package:flutter_shop_app/screens/products_overview_screen.dart';
import 'package:flutter_shop_app/screens/user_product_screen.dart';
import 'package:provider/provider.dart';

import 'providers/cart.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (context) => Products(Auth().token, Auth().userId, []),
          update: (context, auth, previousProducts) => Products(
              auth.token,
              auth.userId,
              previousProducts == null ? [] : previousProducts.items),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (context) => Orders(Auth().token, []),
          update: (context, auth, previousOrders) => Orders(
              auth.token, previousOrders == null ? [] : previousOrders.order),
        ),
      ],
      child: Consumer<Auth>(builder: (
        context,
        auth,
        _,
      ) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'ShopApp',
          theme: ThemeData(
            primarySwatch: Colors.pink,
            accentColor: Color(0xFFFAC66F),
            fontFamily: 'Anton',
          ),
          home: auth.isAuth ? ProductsOverview() : AuthScreen(),
          routes: {
            ProductsDetail.routeName: (context) => ProductsDetail(),
            CartScreen.routeName: (context) => CartScreen(),
            OrderScreen.routeName: (context) => OrderScreen(),
            UserProductSreen.routeName: (context) => UserProductSreen(),
            EditProductScreen.routeName: (context) => EditProductScreen(),
          },
        );
      }),
    );
  }
}
