import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:api_posts/services/address_service.dart';
import 'package:api_posts/services/posts_model.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final ApiService apiService;

  PostCubit(this.apiService) : super(PostInitial());

  Future<void> fetchPosts() async {
    try {
      emit(PostLoading());
      final posts = await apiService.fetchAddressResponses();
      emit(PostSuccess(posts));
    } catch (e) {
      emit(PostFailure(e.toString()));
    }
  }
}
