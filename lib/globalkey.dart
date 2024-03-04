

import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
 final KeyCounter = GlobalKey<CounterWidgetState>();

  @override
  Widget build(BuildContext context) =>
      Scaffold(
appBar: AppBar(
  title: const Text("Flutter Global Key"),
  centerTitle: true,
),
        body:Center(
          child:CounterWidget(key: KeyCounter,),
        ),
        floatingActionButton: FloatingActionButton(child: Icon(Icons.add),onPressed: () {
          final state = KeyCounter.currentState;

          ///method
          state!.increment();

          //state
          print("asasasa:-${state.counter}");

        },),
    );

}
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => CounterWidgetState();
}

class CounterWidgetState extends State<CounterWidget> {
  int counter = 0;

  void increment(){
    setState(() {
      counter += 5;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Text("Couter:$counter");
  }
}

