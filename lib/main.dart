import 'package:api_handling_bloc/Cubit/post_cubit.dart';
import 'package:api_handling_bloc/Repojectoies/post_repostry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Screen/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create:(context)=>PostCubit(),
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen()
    )
    );
  }
}
