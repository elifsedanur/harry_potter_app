import 'package:freezed_annotation/freezed_annotation.dart';


part 'wand.freezed.dart';
part 'wand.g.dart';

@freezed
class Wand with _$Wand{

  const factory Wand({

    String? wood,
    String? core,
    double? length,

}) = _Wand;

  factory Wand.fromJson(Map<String, dynamic> jsonData) => _$WandFromJson(jsonData);

}