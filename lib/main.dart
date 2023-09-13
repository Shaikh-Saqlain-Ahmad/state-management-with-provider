import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_app/favorite/favorite-screen-provider.dart';
import 'package:provider_app/favorite/favorite-screen.dart';
import 'package:provider_app/provider/count_provider.dart';
import 'package:provider_app/provider/screen2_provider.dart';
import 'package:provider_app/provider/theme_changer_provider.dart';
import 'package:provider_app/screen/count.dart';
import 'package:provider_app/screen/dark-theme.dart';
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
          ChangeNotifierProvider(create: (_) => CountProvider()),
          ChangeNotifierProvider(create: (_) => FavoriteProvider()),
          ChangeNotifierProvider(create: (_) => ThemeProvider())
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: true,
            title: 'Flutter Demo',
            themeMode: themeChanger.themeMode,
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
                brightness: Brightness.light,
                appBarTheme: AppBarTheme(backgroundColor: Colors.blue)),
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                primaryColor: Colors.purple,
                appBarTheme: AppBarTheme(backgroundColor: Colors.purple)),
            home: DarkTheme(),
          );
        }));
  }
}
