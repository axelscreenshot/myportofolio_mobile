import 'package:json_annotation/json_annotation.dart';

part 'project.g.dart';

/// Portofolio project synchronized with the Django REST Framework API.
@JsonSerializable(fieldRename: FieldRename.snake)
class Project {
  const Project({
    this.id,
    required this.title,
    required this.description,
    this.thumbnail = '',
    this.view = '',
    this.source = '',
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  @JsonKey(includeToJson: false)
  final String? id;
  final String title;
  final String description;
  @JsonKey(defaultValue: '')
  final String thumbnail;
  @JsonKey(defaultValue: '')
  final String view;
  @JsonKey(defaultValue: '')
  final String source;

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}
