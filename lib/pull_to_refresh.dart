import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class PullToRefresh extends StatefulWidget {
  const PullToRefresh({super.key});

  @override
  State<PullToRefresh> createState() => _PullToRefreshState();
}

class _PullToRefreshState extends State<PullToRefresh> {
  List<String> items = ['Item 1','Item 2','Item 3'];

  Future refresh() async {
    setState(() {
      items.clear();
    });
    final url =  Uri.parse('https://jsonplaceholder.typicode.com/posts');
    final response = await http.get(url);

    if(response.statusCode == 200){
      final List newItems = json.decode(response.body);
      setState(() {
        items = newItems.map((e) {
          final number = e['id'];
          return 'Item $number';
        }).toList();
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(" Pull To Refresh"),),
      body:items.isEmpty?const Center(child: CircularProgressIndicator(),):RefreshIndicator(
        onRefresh: refresh,
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: items.length,
          itemBuilder: (context, index) {
          final item = items[index];

          return ListTile(title: Text(item),);
        },),
      )
    );
  }
}
