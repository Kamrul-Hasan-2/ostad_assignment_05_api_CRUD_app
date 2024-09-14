import 'package:api_product_app/screen/add_new_product.dart';
import 'package:flutter/material.dart';

import '../widget/product_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text('Product List'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: ListView.separated(
            itemBuilder: (context, index) => const ProductList(),
            separatorBuilder: (context, index) => const SizedBox(
                  height: 10,
                ),
            itemCount: 20),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddNewProduct()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
