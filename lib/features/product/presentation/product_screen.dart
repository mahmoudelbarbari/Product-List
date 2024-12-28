import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/features/product/domain/usecase/get_products_usecase.dart';
import 'package:products/features/product/presentation/cubit/product_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../data/product_model.dart';
import '../data/product_service.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      body: BlocProvider(
        create: (context) => ProductCubit(
          GetProductsUseCase(ProductService()),
        )..fetchProducts(),
        child: BlocBuilder<ProductCubit, ProductState>(
          builder: (context, state) {
            if (state is ProductLoading) {
              return _buildLoadingList();
            } else if (state is ProductLoaded) {
              return _buildProductList(state.products);
            } else if (state is ProductError) {
              return Center(child: Text(state.message));
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoadingList() {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Container(width: 150, height: 16, color: Colors.white),
              subtitle: Container(width: 100, height: 14, color: Colors.white),
              leading: Container(
                width: 50,
                height: 50,
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildProductList(List<ProductModel> products) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          margin: EdgeInsets.all(8),
          child: ListTile(
            leading: Image.network(product.image),
            title: Text(product.name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.description,
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                Text('\$${product.price}',
                    style: TextStyle(color: Colors.orangeAccent)),
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.orangeAccent, size: 20),
                    SizedBox(width: 5),
                    Text('4.8', style: TextStyle(fontSize: 16)),
                    SizedBox(width: 5),
                    Text('Ratings', style: TextStyle(fontSize: 16)),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('Size: '),
                    SizedBox(width: 10),
                    CircleAvatar(
                      child: Text('s', style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      child: Text('M', style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(width: 10),
                    CircleAvatar(
                      child: Text('L', style: TextStyle(color: Colors.white)),
                    ),
                    Spacer(),
                    Icon(Icons.favorite_border, color: Colors.orangeAccent),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
