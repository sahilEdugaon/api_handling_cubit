import 'package:api_handling_bloc/Cubit/post_cubit.dart';
import 'package:api_handling_bloc/Cubit/post_state.dart';
import 'package:api_handling_bloc/Model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Home',
      style: TextStyle(fontSize: 24),
    ),
    Text(
      'Search',
      style: TextStyle(fontSize: 24),
    ),
    Text(
      'Profile',
      style: TextStyle(fontSize: 24),
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Handling'),
      ),
      body: SafeArea(
        child: BlocBuilder<PostCubit,PostState>(
          builder: (BuildContext context, state) {

            if(state is PostLoading){
              return Center(child: CircularProgressIndicator(),);
            }
            else if(state is PostErrorState){
              return Center(child: Text(state.error.toString()),);
            }
            else if ( state is PostLoaded){
              return ListView.builder(
                itemCount:  state.post.length,
                itemBuilder: (BuildContext context, int index) {
                 PostModel data = state.post[index];
                  return  Card(
                    elevation: 6,
                    margin: const EdgeInsets.all(5),
                    child: ListTile(
                      title: Text(data.id.toString()),
                      subtitle: Text(data.title.toString()),
                    ),
                  );
                },
              );
            }

            return const Text('An Error');
          },
        ),
      )
    );
  }
}
