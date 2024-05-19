import 'package:api_posts/post_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:api_posts/cubit/post_cubit.dart';
import 'package:get_it/get_it.dart';

class AddressListWidget extends StatelessWidget {
  const AddressListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.I<PostCubit>()..fetchPosts(),
      child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostSuccess) {
            return ListView.builder(
              itemCount: state.postList.length,
              itemBuilder: (context, index) {
                final post = state.postList[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PostDetailPage(post: post),
                    ));
                  },
                );
              },
            );
          } else if (state is PostFailure) {
            return Center(child: Text(state.errorMessage));
          } else {
            return const Center(child: Text('Unknown state'));
          }
        },
      ),
    );
  }
}
