import 'package:flutter/material.dart';
import 'package:shopping/blocs/home.bloc.dart';
import 'package:shopping/models/category-list-item.model.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopping/settings.dart';

class CategoryCard extends StatelessWidget {
  final CategoryListItemModel item;

  CategoryCard({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);

    return Container(
      child: Container(
        width: 70,
        height: 70,
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: item.tag == bloc.selectedCategory
              ? Theme.of(context).primaryColor.withOpacity(0.3)
              : Theme.of(context).primaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(70),
          ),
        ),
        child: FlatButton(
          child: Image.asset(
              "assets/categories/${Settings.theme}/${item.tag}.png"),
          onPressed: () {
            bloc.changeCategory(item.tag);
          },
        ),
      ),
    );
  }
}
