import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/core/bloc_observer/bloc_observer.dart';
import 'package:products/features/product/presentation/product_screen.dart';

void main() {
  Bloc.observer = MyGlobalObserver();
  runApp(MyApp());
  (e, s) {};
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Product List',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProductScreen(),
    );
  }
}
