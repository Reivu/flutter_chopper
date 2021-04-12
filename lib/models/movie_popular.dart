import 'package:json_annotation/json_annotation.dart';

part 'movie_popular.g.dart';

@JsonSerializable()
class Popular {
  int page;
  List<Result> results;

  Popular({this.page, this.results});

  factory Popular.fromJson(Map<String, dynamic> json) =>
      _$PopularFromJson(json);

  Map<String, dynamic> toJson() => _$PopularToJson(this);
}

@JsonSerializable()
class Result {
  int id;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'title')
  String title;
  @JsonKey(name: 'overview')
  String overview;

  Result({
    this.id,
    this.posterPath,
    this.overview,
    this.title,
  });

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
