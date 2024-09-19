import 'package:flutter/material.dart';

class UpdateNewProduct extends StatefulWidget {
  const UpdateNewProduct({super.key});

  @override
  State<UpdateNewProduct> createState() => _UpdateNewProductState();
}

class _UpdateNewProductState extends State<UpdateNewProduct> {
  final TextEditingController _productNameTEController =
  TextEditingController();
  final TextEditingController _unitPriceTEController = TextEditingController();
  final TextEditingController _totalPriceTEController = TextEditingController();
  final TextEditingController _productImagesTEController =
  TextEditingController();
  final TextEditingController _productCodeTEController =
  TextEditingController();
  final TextEditingController _quantityTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _productNameTEController,
            decoration: InputDecoration(
                hintText: 'Product Name', label: Text('Product Name')),
          ),
          TextFormField(
            controller: _unitPriceTEController,
            decoration: InputDecoration(
                hintText: 'Unit Price', label: Text('Unit Price')),
          ),
          TextFormField(
            controller: _totalPriceTEController,
            decoration: InputDecoration(
                hintText: 'Total Price', label: Text('Total Price')),
          ),
          TextFormField(
            controller: _productImagesTEController,
            decoration: InputDecoration(
                hintText: 'Product Image', label: Text('Product Image')),
          ),
          TextFormField(
            controller: _productCodeTEController,
            decoration: InputDecoration(
                hintText: 'Product Code', label: Text('Product Code')),
          ),
          TextFormField(
            controller: _quantityTEController,
            decoration: InputDecoration(
                hintText: 'Quantity', label: Text('Quantity')),
          ),
          SizedBox(
            height: 16,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size.fromWidth(double.maxFinite),
            ),
            onPressed: _addOnTapAddProduct,
            child: Text('Update'),
          ),
        ],
      ),
    );
  }


  void _addOnTapAddProduct(){

  }

  @override
  void dispose() {
    _productNameTEController.dispose();
    _unitPriceTEController.dispose();
    _totalPriceTEController.dispose();
    _productImagesTEController.dispose();
    _productCodeTEController.dispose();
    _quantityTEController.dispose();

    super.dispose();
  }
}
