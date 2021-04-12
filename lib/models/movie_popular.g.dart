// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_popular.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Popular _$PopularFromJson(Map<String, dynamic> json) {
  return Popular(
    page: json['page'] as int,
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : Result.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$PopularToJson(Popular instance) => <String, dynamic>{
      'page': instance.page,
      'results': instance.results,
    };

Result _$ResultFromJson(Map<String, dynamic> json) {
  return Result(
    id: json['id'] as int,
    posterPath: json['poster_path'] as String,
    overview: json['overview'] as String,
    title: json['title'] as String,
  );
}

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'id': instance.id,
      'poster_path': instance.posterPath,
      'title': instance.title,
      'overview': instance.overview,
    };
