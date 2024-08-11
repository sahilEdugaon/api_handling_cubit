import '../Model/model.dart';

abstract class PostState{}


class PostLoading extends PostState{}

class PostErrorState extends PostState{
  final String error;
  PostErrorState(this.error);
}

class PostLoaded extends PostState{
  final List<PostModel> post;
  PostLoaded(this.post);
}