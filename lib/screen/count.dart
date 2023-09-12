import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/count_provider.dart';

class Count extends StatefulWidget {
  const Count({super.key});

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  @override
  Widget build(BuildContext context) {
    final countProvider = Provider.of<CountProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: Center(child: Consumer<CountProvider>(
        builder: (context, value, child) {
          return Text(value.count.toString());
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countProvider.setcounter();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
