import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_hive/productData.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Products'),
        ),
        body: Consumer<ProductData>(
          builder: (context, myProductData, child) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                      'Number of products: ${myProductData.productList.length.toString()}'),
                ),
                FlatButton.icon(
                  onPressed: () {
                    myProductData.removeProduct();
                  },
                  icon: Icon(Icons.delete),
                  label: Text('Delete'),
                )
              ]),
        ));
  }
}
