import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_model.freezed.dart';
part 'api_model.g.dart';
@freezed
class ApiModel with _$ApiModel{
   const factory ApiModel({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) = _ApiModel;
  factory ApiModel.fromJson(Map<String, dynamic> json) =>
      _$ApiModelFromJson(json);
}