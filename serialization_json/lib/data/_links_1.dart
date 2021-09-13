import 'dart:convert';

import 'self.dart';

class _links {
  final Self self;
  _links({
    required this.self,
  });

  _links copyWith({
    Self? self,
  }) {
    return _links(
      self: self ?? this.self,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'self': self.toMap(),
    };
  }

  factory _links.fromMap(Map<String, dynamic> map) {
    return _links(
      self: Self.fromMap(map['self']),
    );
  }

  String toJson() => json.encode(toMap());

  factory _links.fromJson(String source) => _links.fromMap(json.decode(source));

  @override
  String toString() => '_links(self: $self)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is _links &&
      other.self == self;
  }

  @override
  int get hashCode => self.hashCode;
}