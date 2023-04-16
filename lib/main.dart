import 'package:flutter/material.dart';
import 'package:product_api/screen/home/provider/home_provider.dart';
import 'package:product_api/screen/home/view/home_screen.dart';
import 'package:product_api/screen/home/view/second.dart';
import 'package:provider/provider.dart';
void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Homeprovider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/':(context) => home(),
          'second':(context) => second(),
        },
      ),
    )
  );
}