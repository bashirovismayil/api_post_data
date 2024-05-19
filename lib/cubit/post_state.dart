part of 'post_cubit.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

final class PostLoading extends PostState {}

final class PostSuccess extends PostState {
  final List<PostModel> postList;

  PostSuccess(this.postList);
}

final class PostFailure extends PostState {
  final String errorMessage;

  PostFailure(this.errorMessage);
}
