import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favorite-screen-provider.dart';

class Myfavorite extends StatefulWidget {
  const Myfavorite({super.key});

  @override
  State<Myfavorite> createState() => _MyfavoriteState();
}

class _MyfavoriteState extends State<Myfavorite> {
  List<String> fruits = [
    'apple',
    'mango',
    'orange',
    'pineapple',
    'pear',
    'gauva',
    'strawberry',
    'banana'
  ];
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite"),
        actions: [
          InkWell(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Icon(Icons.favorite),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Myfavorite(),
                  ));
            },
          )
        ],
      ),
      body: Column(children: [
        Expanded(
          child: ListView.builder(
              itemCount: favoriteProvider.selectedItem.length,
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
                      title: Text(fruits[index]),
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
