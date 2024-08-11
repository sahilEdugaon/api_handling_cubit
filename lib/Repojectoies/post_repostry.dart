import 'dart:math';

import 'package:api_handling_bloc/Model/model.dart';
import 'package:api_handling_bloc/Repojectoies/api.dart';
import 'package:dio/dio.dart';

class PostRepository{

  API api = API();
  Future<List<PostModel>> fetchPost() async {

    try{
      Response response = await api.sendRequest.get('/todos');
      List <dynamic> postMap = response.data;
      print(response.data);
      return postMap.map((e) => PostModel.fromJson(e)).toList();

    }
    catch(e){
      throw e;
    }
  }


}