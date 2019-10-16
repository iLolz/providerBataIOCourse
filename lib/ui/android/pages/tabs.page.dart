import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping/blocs/cart.bloc.dart';
import 'package:shopping/ui/android/pages/account.page.dart';
import 'package:shopping/ui/android/pages/cart.page.dart';
import 'package:shopping/ui/android/pages/home.page.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<CartBloc>(context);

    return Scaffold(
      body: TabBarView(
        children: <Widget>[
          HomePage(),
          CartPage(),
          AccountPage(),
        ],
      ),
      bottomNavigationBar: new TabBar(
        tabs: <Widget>[
          Tab(
            icon: new Icon(Icons.home),
          ),
          Tab(
            icon: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(Icons.shopping_cart),
                Container(
                  width: 18,
                  height: 18,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(18))),
                  child: Text(
                    bloc.cart.length.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          Tab(
            icon: new Icon(Icons.perm_identity),
          ),
        ],
        labelColor: Theme.of(context).primaryColor,
        unselectedLabelColor: Colors.black38,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorPadding: EdgeInsets.all(5.0),
        indicatorColor: Theme.of(context).primaryColor,
      ),
    );
  }
}