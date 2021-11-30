import 'package:ecommerce_coba/app_properties.dart';
import 'package:ecommerce_coba/models/product.dart';
import 'package:ecommerce_coba/screens/product/components/color_list.dart';
import 'package:ecommerce_coba/screens/product/components/shop_product.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class ShopItemList extends StatefulWidget {
  final Product product;
  final VoidCallback onRemove;

  ShopItemList(this.product, {required this.onRemove});

  @override
  _ShopItemListState createState() => _ShopItemListState();
}

class _ShopItemListState extends State<ShopItemList> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10, right: 10, left: 10),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: shadow,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10))
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: [
                Row(children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: 90,
                    child: Image.asset(
                      '${widget.product.image}',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              widget.product.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                                color: darkGrey,
                              ),
                            ),
                          ),
                          Text(
                            '\Rp ${widget.product.price}.000',
                            style: TextStyle(
                                color: darkGrey,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
                Container(
                  margin: EdgeInsets.only(left: 80),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: widget.onRemove,
                        icon: Icon(
                          Icons.delete_forever,
                          color: Colors.red,
                        ),
                      ),
                      Text(
                        'Remove',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Theme(
            data: ThemeData(
                accentColor: Colors.black,
                textTheme: TextTheme(
                  headline6: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  bodyText1: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 12,
                    color: Colors.grey[400],
                  ),
                )),
            child: NumberPicker(
              value: quantity,
              minValue: 1,
              maxValue: 10,
              onChanged: (value) {
                setState(() {
                  quantity = value;
                });
              },
            )
          ),
        ]
      ),
    );
  }
}
