import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_hive/product.dart';
import 'package:provider_hive/productData.dart';
import 'package:provider_hive/productPage.dart';
import 'dart:math';
import 'dart:developer';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductData(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Consumer<ProductData>(builder: (context, myProductData, child) {
              // for (var i = 0; i < myProductData.productList.length; i++) {
              //   print(myProductData.productList[i].productName);
              // }
              // inspect(myProductData);
              return Text(
                myProductData.productList.length.toString(),
                style: Theme.of(context).textTheme.headline4,
              );
            }),
            SizedBox(
              width: 150.0,
              child: FlatButton(
                  color: Colors.blueGrey,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => ProductPage()));
                  },
                  child: Center(
                    child: Text('Cart'),
                  )),
            )
          ],
        ),
      ),
      floatingActionButton: Consumer<ProductData>(
        builder: (context, myProductData, child) => FloatingActionButton(
          onPressed: () {
            Product product =
                Product(productName: 'something', price: Random().nextDouble());
            myProductData.addProduct(product);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
