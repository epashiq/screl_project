import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screl_project/controller/api_service.dart';
import 'package:screl_project/model/api_model.dart';

final apiProvider = FutureProvider<List<ApiModel>?>((ref) async {
  return ApiService.fetchData();
});