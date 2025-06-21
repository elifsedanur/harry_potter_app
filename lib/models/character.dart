import 'package:daynex_test_calismasi/models/wand.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
class Character with _$Character{

  const factory Character({

    required String id,
    required String name,
    @JsonKey(name: 'alternate_names')
    @Default([]) List<String> alternateNames,
    String? species,
    String? gender,
    String? house,
    String? dateOfBirth,
    int? yearOfBirth,
    bool? wizard,
    String? ancestry,
    String? eyeColour,
    String? hairColour,
    Wand? wand,
    String? patronus,
    bool? hogwartsStudent,
    bool? hogwartsStaff,
    String? actor,
    @JsonKey(name: 'alternate_actors')
    @Default([]) List<String> alternateActors,
    bool? alive,
    String? image
}) = _Character;

  factory Character.fromJson(Map<String,dynamic> jsonData) => _$CharacterFromJson(jsonData);
}


