import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/provider/count_provider.dart';
import 'package:provider_app/provider/screen2_provider.dart';
import 'package:provider_app/screen/count.dart';
import 'package:provider_app/screen/screen2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => Screen2Provider()),
          ChangeNotifierProvider(create: (_) => CountProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: Screen2(),
        ));
  }
}
