import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/favorite/favorite-screen-provider.dart';

class Favorite extends StatefulWidget {
  const Favorite({super.key});

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
  List<int> selectedItem = [];
  @override
  Widget build(BuildContext context) {
    // final favoriteProvider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Favorite")),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return Consumer<FavoriteProvider>(
                  builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeitem(index);
                        } else {
                          value.additem(index);
                        }
                      },
                      title: Text('Item' + index.toString()),
                      trailing: Icon(value.selectedItem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_border_outlined),
                    );
                  },
                );
              }),
        )
      ]),
    );
  }
}
