import 'dart:convert';
import 'package:api_product_app/screen/add_new_product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../models/product.dart';
import '../widget/product_list_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Product> productList = [];

  bool _inProgress = false;

  @override
  void initState() {
    super.initState();
    getProductList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Text('Product List'),

        actions: [
          IconButton(onPressed: (){
            getProductList();
          }, icon: const Icon(Icons.refresh))
        ],
      ),
      body: _inProgress ? const Center(
        child: CircularProgressIndicator(),
      ) : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: ListView.separated(
            itemBuilder: (context, index) =>  ProductList(product: productList[index],),
            separatorBuilder: (context, index) =>
            const SizedBox(
              height: 10,
            ),
            itemCount: productList.length,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNewProduct()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }


  Future<void> getProductList() async {
    setState(() {});
    _inProgress = true;


    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/ReadProduct');
    Response response = await get(uri);

    print(response);
    print(response.statusCode);
    print(response.body);

    if (response.statusCode == 200) {
      productList.clear();
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      for (var item in jsonResponse['data']) {
        Product product = Product(
            id: item['_id'] ?? '',
            productName: item['ProductName'] ?? '',
            productCode: item['ProductCode'] ?? '',
            img: item['Img'] ,
            unitPrice: item['UnitPrice'] ?? '',
            quantity: item['Qty'] ?? '',
            totalPrice: item['TotalPrice'] ?? '',
            createdAt: item['CreatedDate'] ?? ''
        );
        productList.add(product);
      }
    }
    _inProgress = false;
    setState(() {});
  }
}
