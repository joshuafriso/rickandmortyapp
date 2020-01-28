import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:rickandmortyapp/widgets/list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();
  String nextPage = "http://rickandmortyapi.com/api/character/?page=1";

  bool isLoading = false;

  List characteres = List();

  final dio = Dio();

  void _getData() async {
    if(!isLoading){
      setState(() {
        isLoading = true;
      });
    }

    final response = await dio.get(nextPage);
    List temp = List();
    nextPage = response.data["info"]["next"];
    for(int i = 0; i < response.data["results"].length; i++){
      temp.add(response.data["results"][i]);
    }
    setState(() {
      isLoading = false;
      characteres.addAll(temp);
    });
  }

  
  @override
  void initState() {
    _getData();
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) _getData();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personagens"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: ListWidget(_scrollController, characteres, isLoading),
    );
  }
}
