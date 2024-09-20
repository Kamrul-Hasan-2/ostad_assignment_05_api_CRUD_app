import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class AddNewProduct extends StatefulWidget {
  const AddNewProduct({super.key});


  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
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
        title: const Text('Add New Product'),
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
                decoration: const InputDecoration(
                    hintText: 'Product Name', label: Text('Product Name')),
                validator: (String? value){
                  if(value == null || value.isEmpty){
                    return 'Enter a valid Product name';
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
                    return 'Enter a valid Unit price';
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
                    return 'Enter a valid Total Price';
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
                    return 'Enter a valid Product image';
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
                    return 'Enter a valid Product Code';
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
                    return 'Enter a valid Quantity';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              _inProgress ? const Center(
                child: CircularProgressIndicator(),
              ) : ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(double.maxFinite),
                ),
                onPressed: _addOnTapAddProduct,
                child: const Text('Add New Product'),
              ),
            ],
          ),
        );
  }


  void _addOnTapAddProduct(){
    if(_formKey.currentState!.validate()){
      addNewProduct();
    }
  }


  Future<void> addNewProduct () async{
    _inProgress = true;
    setState(() {});

    Map<String, dynamic> requestBody = {
      "Img":_productImagesTEController.text,
      "ProductCode":_productCodeTEController.text,
      "ProductName":_productNameTEController.text,
      "Qty": _quantityTEController.text,
      "TotalPrice": _totalPriceTEController.text,
      "UnitPrice": _unitPriceTEController.text
    };

    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/CreateProduct');
    Response response = await post(uri,
        headers: {
          "Content-Type" : "application/json"
        },
        body: jsonEncode(requestBody));

    print(response.statusCode);
    print(response.body);
    if(response.statusCode == 200){
      _clearTextField();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Add New Item Successfully'))
      );
    }

    _inProgress = false;
    setState(() {});
  }

  void _clearTextField() {
    _productNameTEController.clear();
    _unitPriceTEController.clear();
    _totalPriceTEController.clear();
    _productImagesTEController.clear();
    _productCodeTEController.clear();
    _quantityTEController.clear();
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
