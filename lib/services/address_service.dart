import 'package:api_posts/services/endpoints.dart';
import 'package:api_posts/services/posts_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<List<PostModel>> fetchAddressResponses() async {
    final response = await _dio.get(Endpoint.posts);
    return (response.data as List)
        .map((json) => PostModel.fromJson(json))
        .toList();
  }
}
