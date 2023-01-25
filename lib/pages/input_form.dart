import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  Order _order = Order();

  String? _validateItemRequired(String value) {
    return value.isEmpty ? 'Item Required' : null;
  }

  String? _validateItemCount(String value) {
    int? _valueAsInteger = value.isEmpty ? 0 : int.tryParse(value);
    return _valueAsInteger == 0 ? 'At least one Item is Required' : null;
  }

  _submitOrder() {
    if(_formStateKey.currentState!.validate()) {
      _formStateKey.currentState!.save();
      print('Order Item: ${_order.item}');
      print('Order Quantity: ${_order.quantity}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Validation'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Form(
              key: _formStateKey,
              autovalidateMode: AutovalidateMode.always,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Espresso',
                        labelText: 'Item',
                      ),
                      validator: (value) => _validateItemRequired(value!),
                      onSaved: (value) => _order.item = value!,
                    ),
                    TextFormField(
                      decoration:  InputDecoration(
                        hintText: '3',
                        labelText: 'Quantity',
                      ),
                      validator: (value) => _validateItemCount(value!),
                      onSaved: (value) => _order.quantity = int.parse(value!),
                    ),
                    Divider(height: 32.0,),
                    ElevatedButton(
                      child: Text('Save'),
                      //color: Colors.lightGreen,
                      onPressed: () => _submitOrder(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class Order {
  String item = "item";
  int quantity = 1;
}