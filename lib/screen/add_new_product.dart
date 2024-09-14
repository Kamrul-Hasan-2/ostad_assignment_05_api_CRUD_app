import 'package:flutter/material.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({super.key});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add New Product'),
          centerTitle: true,
        ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Product Name',
                label: Text('Product Name')
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Unit Price',
                  label: Text('Unit Price')
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Total Price',
                  label: Text('Total Price')
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Product Image',
                  label: Text('Product Image')
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Product Code',
                  label: Text('Product Code')
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  hintText: 'Quantity',
                  label: Text('Quantity')
              ),
            ),
          ],
        ),
      ),
    );
  }
}
