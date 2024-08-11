import 'package:api_handling_bloc/Cubit/post_state.dart';
import 'package:api_handling_bloc/Model/model.dart';
import 'package:api_handling_bloc/Repojectoies/post_repostry.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() :super(PostLoading()) {
    fetchost();
  }

  PostRepository postRepository = PostRepository();

  Future<void> fetchost() async {
    try {
      List <PostModel>posts = await postRepository.fetchPost();
      emit(PostLoaded(posts));
    }
    on DioError catch (e) {
      if(e.type == DioExceptionType.connectionError){
        emit(PostErrorState('Cant fetch post,please check your internet Connection'));
      }else{
        emit(PostErrorState(e.toString()));

      }
    }
  }
}