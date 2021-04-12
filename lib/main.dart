import 'package:flutter/material.dart';
import 'package:flutter_chopper/models/movie_api.dart';
import 'package:flutter_chopper/screens/homescreen.dart';
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

void main() {
  _setupLogging();
  runApp(MyApp());
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) {
    print('${event.level.name}.${event.time}.${event.message}');
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => MovieService.create(),
      dispose: (_, MovieService movieService) => movieService.client.dispose(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Chopper',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
