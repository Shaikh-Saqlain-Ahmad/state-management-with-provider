import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/screen2_provider.dart';

class Screen2 extends StatefulWidget {
  const Screen2({super.key});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  double value = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Screen 2"))),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Consumer<Screen2Provider>(
          builder: (context, value, child) {
            return Slider(
              min: 0,
              max: 1,
              value: value.value,
              onChanged: (val) {
                value.setvalue(val);
              },
            );
          },
        ),
        Consumer<Screen2Provider>(
          builder: (context, value, child) {
            return Row(
              children: [
                Expanded(
                  child: Container(
                    child: Center(
                      child: Center(child: Text("Container 1")),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.purpleAccent.withOpacity(value.value)),
                    height: 100,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Center(
                      child: Center(child: Text("Container 2")),
                    ),
                    decoration: BoxDecoration(
                        color: Colors.indigoAccent.withOpacity(value.value)),
                    height: 100,
                  ),
                )
              ],
            );
          },
        ),
      ]),
    );
  }
}
