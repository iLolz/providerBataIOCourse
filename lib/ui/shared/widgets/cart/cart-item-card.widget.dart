import 'package:flutter/material.dart';
import 'package:shopping/blocs/cart.bloc.dart';
import 'package:shopping/models/cart-item.mode.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final CartItemModel item;

  const CartItem({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<CartBloc>(context);
    final price = new NumberFormat("#,##0.00", "pt_BR");

    return Container(
      height: 120,
      margin: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: 100,
            height: 100,
            child: Image.network(
              item.image,
              fit: BoxFit.fitWidth,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 20,
              left: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(item.title),
                Text(
                  "R\$ ${price.format(item.price)}",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "R\$ ${price.format((item.price * item.quantity))}",
                ),
                Container(
                    height: 30,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.all(
                        Radius.circular(5),
                      ),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 40,
                          alignment: Alignment.center,
                          child: FlatButton(
                            onPressed: () {
                              bloc.decrease(item);
                            },
                            child: Text("-"),
                          ),
                        ),
                        Container(
                          width: 40,
                          alignment: Alignment.center,
                          child: Text("${item.quantity}"),
                        ),
                        Container(
                          width: 40,
                          alignment: Alignment.center,
                          child: FlatButton(
                            onPressed: () {
                              bloc.increase(item);
                            },
                            child: Text("+"),
                          ),
                        ),
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
