import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:screl_project/model/api_model.dart';

class ApiService {
  static final dio = Dio();
  static Future<List<ApiModel>?> fetchData() async {
    const path = 'https://jsonplaceholder.typicode.com/posts';
    try {
      final Response response = await dio.get(path);
      if (response.statusCode == 200) {
        final posts = <ApiModel>[];
        for (var i in response.data) {
          posts.add(ApiModel.fromJson(i));
        }
        return posts;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

