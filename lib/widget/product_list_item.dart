import 'package:api_product_app/models/product.dart';
import 'package:api_product_app/screen/update_new_product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ProductList extends StatefulWidget {
  const ProductList({
    super.key,
    required this.product,
  });


  final Product product;

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      title: Text(widget.product.productName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product Code: ${widget.product.productCode}'),
          Text('Price: \$${widget.product.unitPrice}'),
          Text('Quantity : ${widget.product.quantity}'),
          Text('Total Price : \$${widget.product.totalPrice}'),
          const Divider(),
          ButtonBar(
            children: [
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateNewProduct(
                          productId: widget.product.id,
                        ),
                      ));
                },
                icon: const Icon(Icons.edit),
                label: const Text('Edit'),
              ),
              TextButton.icon(
                onPressed: _onTapProductDelete,
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                label: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }


  // TODO : Error solving korte hobe
  void _onTapProductDelete() {
    setState(() {});
    productDelete();
  }

  Future<void> productDelete() async {
    var request = Request('GET', Uri.parse('http://164.68.107.70:6060/api/v1/DeleteProduct'));
    StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    }
    else {
      print(response.reasonPhrase);
    }
  }
}
