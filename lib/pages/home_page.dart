import 'package:flutter/material.dart';
import 'package:rickandmortyapp/services/api_service.dart';
import 'package:rickandmortyapp/widgets/list_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();

  bool isLoading = false;

  List characteres = List();

  ApiService api = ApiService();

  void _getData() async {
    if(!isLoading){
      setState(() {
        isLoading = true;
      });
    }

    List temp = List();

    temp = await api.getData();
    
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
