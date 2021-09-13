import 'dart:convert';

import 'package:collection/collection.dart';

import 'hit.dart';

class RecipeModel {
  final int from;
  final int to;
  final int count;
  final _links _links;
  final List<Hit> hits;
  RecipeModel({
    required this.from,
    required this.to,
    required this.count,
    required this._links,
    required this.hits,
  });

  RecipeModel copyWith({
    int? from,
    int? to,
    int? count,
    _links? _links,
    List<Hit>? hits,
  }) {
    return RecipeModel(
      from: from ?? this.from,
      to: to ?? this.to,
      count: count ?? this.count,
      _links: _links ?? this._links,
      hits: hits ?? this.hits,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'from': from,
      'to': to,
      'count': count,
      '_links': _links.toMap(),
      'hits': hits?.map((x) => x.toMap())?.toList(),
    };
  }

  factory RecipeModel.fromMap(Map<String, dynamic> map) {
    return RecipeModel(
      from: map['from']?.toInt(),
      to: map['to']?.toInt(),
      count: map['count']?.toInt(),
      _links: _links.fromMap(map['_links']),
      hits: List<Hit>.from(map['hits']?.map((x) => Hit.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipeModel.fromJson(String source) => RecipeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'RecipeModel(from: $from, to: $to, count: $count, _links: $_links, hits: $hits)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;
  
    return other is RecipeModel &&
      other.from == from &&
      other.to == to &&
      other.count == count &&
      other._links == _links &&
      listEquals(other.hits, hits);
  }

  @override
  int get hashCode {
    return from.hashCode ^
      to.hashCode ^
      count.hashCode ^
      _links.hashCode ^
      hits.hashCode;
  }
}