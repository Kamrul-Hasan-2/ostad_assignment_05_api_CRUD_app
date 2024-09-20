import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class UpdateNewProduct extends StatefulWidget {
  const UpdateNewProduct({super.key, required this.productId});

  final String productId;

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



  bool _inProgress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Product'),
        centerTitle: true,
      ),
      body: _inProgress ? const Center(
        child: CircularProgressIndicator(),
      ) : Padding(
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
            decoration: const InputDecoration(
                hintText: 'Product Name', label: Text('Product Name')),
            validator: (String? value){
              if(value == null || value.isEmpty){
                return 'Enter a value';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _unitPriceTEController,
            decoration: const InputDecoration(
                hintText: 'Unit Price', label: Text('Unit Price')),
            validator: (String? value){
              if(value == null || value.isEmpty){
                return 'Enter a value';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _totalPriceTEController,
            decoration: const InputDecoration(
                hintText: 'Total Price', label: Text('Total Price')),
            validator: (String? value){
              if(value == null || value.isEmpty){
                return 'Enter a value';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _productImagesTEController,
            decoration: const InputDecoration(
                hintText: 'Product Image', label: Text('Product Image')),
            validator: (String? value){
              if(value == null || value.isEmpty){
                return 'Enter a value';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _productCodeTEController,
            decoration: const InputDecoration(
                hintText: 'Product Code', label: Text('Product Code')),
            validator: (String? value){
              if(value == null || value.isEmpty){
                return 'Enter a value';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _quantityTEController,
            decoration: const InputDecoration(
                hintText: 'Quantity', label: Text('Quantity')),
            validator: (String? value){
              if(value == null || value.isEmpty){
                return 'Enter a value';
              }
              return null;
            },
          ),
          const SizedBox(
            height: 16,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: const Size.fromWidth(double.maxFinite),
            ),
            onPressed: _addOnTapAddProduct,
            child: const Text('Update'),
          ),
        ],
      ),
    );
  }
  
  Future<void> productUpdate() async {

    _inProgress = true;
    setState(() {});

    var headers = {
      'Content-Type': 'application/json'
    };
    var request = Request('POST', Uri.parse('http://164.68.107.70:6060/api/v1/UpdateProduct/${widget.productId}'));
    request.body = json.encode({
      "Img": _productImagesTEController.text,
      "ProductCode": _productCodeTEController.text,
      "ProductName": _productNameTEController.text,
      "Qty": _quantityTEController.text,
      "TotalPrice": _totalPriceTEController.text,
      "UnitPrice": _unitPriceTEController.text
    });
    request.headers.addAll(headers);

    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Update')));
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }




    _inProgress = false;
    setState(() {});
    print('Updated');
  }

  void _addOnTapAddProduct(){
    if(_formKey.currentState!.validate()){
      productUpdate();
    }
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
