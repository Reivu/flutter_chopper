import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chopper/models/movie_api.dart';
import 'package:flutter_chopper/models/movie_popular.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const String IMAGE_URL = "https://image.tmdb.org/t/p/w500/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie DB'),
      ),
      body: _buildBody(context),
    );
  }

  FutureBuilder<Response<Popular>> _buildBody(BuildContext context) {
    return FutureBuilder<Response<Popular>>(
      future: Provider.of<MovieService>(context).getPopularMovie(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                snapshot.error.toString(),
                textAlign: TextAlign.center,
                textScaleFactor: 1.3,
              ),
            );
          }

          final popular = snapshot.data.body;

          return _buildMovieList(context, popular);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  ListView _buildMovieList(BuildContext context, Popular popular) {
    return ListView.builder(
      itemCount: popular.results.length,
      padding: EdgeInsets.all(8),
      itemBuilder: (context, index) {
        return Card(
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 150,
                  height: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(
                              IMAGE_URL + popular.results[index].posterPath),
                          fit: BoxFit.contain)),
                ),
                Expanded(
                  child: Container(
                    height: 200,
                    child: Column(
                      children: <Widget>[
                        Text(
                          popular.results[index].title,
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Expanded(
                            child: Container(
                                child: Text(
                          popular.results[index].overview,
                          style: TextStyle(fontSize: 12),
                        ))),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
