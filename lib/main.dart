import 'package:flutter/material.dart';
import 'package:api_posts/cubit/post_cubit.dart';
import 'package:api_posts/services/address_service.dart';
import 'package:get_it/get_it.dart';
import 'package:api_posts/home_screen.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

void setupLocator() {
  GetIt.I.registerLazySingleton(() => ApiService());
  GetIt.I.registerLazySingleton(() => PostCubit(GetIt.I<ApiService>()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Post App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
