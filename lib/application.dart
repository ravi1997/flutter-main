import 'package:json_annotation/json_annotation.dart';

part 'application.g.dart';

@JsonSerializable()
class Application {
  int id;
  String name;
  String description;
  String? index;
  String? api;

  Application({
    required this.id,
    required this.name,
    required this.description,
    this.index,
    this.api,
  });

  factory Application.fromJson(Map<String, dynamic> json) => _$ApplicationFromJson(json);
  Map<String, dynamic> toJson() => _$ApplicationToJson(this);
}
