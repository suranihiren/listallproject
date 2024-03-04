import 'package:flutter/material.dart';

class MainPageState extends StatefulWidget {
  const MainPageState({super.key});

  @override
  State<MainPageState> createState() => _MainPageStateState();
}


class _MainPageStateState extends State<MainPageState> {
  final items = const[Text("Item 1"),Text("Item 2"),Text("Item 3")];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child:ConstrainedBox(constraints: BoxConstraints(minHeight: constraints.maxHeight),
          child: IntrinsicHeight(
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(height: 200,width:double.infinity,color: Colors.deepOrangeAccent,child: Center(child: Text("Item 1")),),
                Container(height: 200,width:double.infinity,color: Colors.orange,child: Center(child: Text("Item 2")),),
              ],
            ),
          )),
        );
      },)

    );

  }
}
