import 'package:chopper/chopper.dart';
import 'package:flutter_chopper/models/movie_popular.dart';
import 'package:flutter_chopper/services/header.dart';
import 'package:flutter_chopper/services/model_converter.dart';

part 'movie_api.chopper.dart';

@ChopperApi()
abstract class MovieService extends ChopperService {
  @Get(path: '/movie/popular')
  Future<Response<Popular>> getPopularMovie();

  static MovieService create() {
    final client = ChopperClient(
      baseUrl: 'https://api.themoviedb.org/3',
      interceptors: [HeaderAPI(), HttpLoggingInterceptor()],
      converter: ModelConverter(),
      errorConverter: JsonConverter(),
      services: [
        _$MovieService(),
      ],
    );
    return _$MovieService(client);
  }
}
