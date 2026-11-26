import 'package:json_annotation/json_annotation.dart';

part 'experience.g.dart';

enum ExperienceCategory {
  @JsonValue('internship')
  internship('Internship'),
  @JsonValue('research')
  research('Research'),
  @JsonValue('volunteer')
  volunteer('Volunteer'),
  @JsonValue('part-time')
  partTime('Part-Time'),
  @JsonValue('full-time')
  fullTime('Full-Time'),
  @JsonValue('freelance')
  freelance('Freelance');

  const ExperienceCategory(this.label);

  final String label;
}

/// Portofolio experience synchronized with the Django REST Framework API.
@JsonSerializable(fieldRename: FieldRename.snake)
class Experience {
  const Experience({
    this.id,
    required this.title,
    required this.description,
    this.category = ExperienceCategory.fullTime,
    this.thumbnail = '',
  });

  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);

  @JsonKey(includeToJson: false)
  final String? id;
  final String title;
  final String description;
  @JsonKey(defaultValue: ExperienceCategory.fullTime)
  final ExperienceCategory category;
  @JsonKey(defaultValue: '')
  final String thumbnail;

  Map<String, dynamic> toJson() => _$ExperienceToJson(this);
}
