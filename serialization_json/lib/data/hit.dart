import 'dart:convert';

import 'recipe.dart';

class Hit {
  final Recipe recipe;
  final _links _links;
  Hit({
    required this.recipe,
    required this._links,
  });

  Hit copyWith({
    Recipe? recipe,
    _links? _links,
  }) {
    return Hit(
      recipe: recipe ?? this.recipe,
      _links: _links ?? this._links,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'recipe': recipe.toMap(),
      '_links': _links.toMap(),
    };
  }

  factory Hit.fromMap(Map<String, dynamic> map) {
    return Hit(
      recipe: Recipe.fromMap(map['recipe']),
      _links: _links.fromMap(map['_links']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Hit.fromJson(String source) => Hit.fromMap(json.decode(source));

  @override
  String toString() => 'Hit(recipe: $recipe, _links: $_links)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Hit &&
      other.recipe == recipe &&
      other._links == _links;
  }

  @override
  int get hashCode => recipe.hashCode ^ _links.hashCode;
}