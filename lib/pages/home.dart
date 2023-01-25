import 'package:flutter/material.dart';
import 'package:mapd722_pay_calculator_carlos_hernandez/pages/about.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {

  final GlobalKey<FormState> _formStateKey = GlobalKey<FormState>();

  Payment _payment = Payment();


  _calculate() {
    if(_formStateKey.currentState!.validate()) {
      _formStateKey.currentState!.save();
      if (_payment.hours <= 40){
        _payment.payment_regular = _payment.hours * _payment.payrate;
        _payment.payment_extra = 0;
      }else{
        _payment.payment_regular = 40 * _payment.payrate;
        _payment.payment_extra = (_payment.hours - 40) * _payment.payrate * 1.5;
      }
      _payment.payment_total = _payment.payment_regular + _payment.payment_extra;
      _payment.payment_taxes = _payment.payment_total * 0.18;

      print('Regular: ${_payment.payment_regular}');
      print('Extra: ${_payment.payment_extra}');
      print('Total: ${_payment.payment_total}');
      print('Taxes: ${_payment.payment_taxes}');
      //print('Order Item: ${_order.item}');
      //print('Order Quantity: ${_order.quantity}');
    }
  }

  String? _validateHours(String value) {
    double? _valueAsDouble = value.isEmpty ? 0 : double.tryParse(value);
    return _valueAsDouble == 0 ? 'The minimum hours are 1' : null;
  }

  String? _validatePayRate(String value) {
    double? _valueAsDouble = value.isEmpty ? 0 : double.tryParse(value);
    return _valueAsDouble == 0 ? 'The minimum pay rate is 15' : null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('First Assignment'),
        /*leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () { },
        ),

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],*/

      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SafeArea(
          child: SingleChildScrollView(
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
                            hintText: '40',
                            labelText: 'Hours',
                          ),
                          validator: (value) => _validateHours(value!),
                          onSaved: (value) => _payment.hours = double.parse(value!),
                        ),
                        TextFormField(
                          decoration:  InputDecoration(
                            hintText: '15.5',
                            labelText: 'Hourly rate',
                          ),
                          validator: (value) => _validatePayRate(value!),
                          onSaved: (value) => _payment.payrate = double.parse(value!),
                        ),
                        Divider(height: 32.0,),
                        ElevatedButton(
                          child: Text('Save'),
                          //color: Colors.lightGreen,
                          onPressed: () => _calculate(),
                        ),
                      ],
                    ),
                  ),
                ),

                AboutWidget(),
                Divider(),

              ],
            ),
          ),
        ),
      ),  
    );
  }
}


class Payment{
  double hours = 0;
  double payrate = 0;

  double payment_regular = 0;
  double payment_extra = 0;
  double payment_total = 0;
  double payment_taxes = 0;
}