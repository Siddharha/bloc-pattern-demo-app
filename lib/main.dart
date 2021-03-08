
import 'package:demo_app/counter_block.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.amber,
        appBarTheme: AppBarTheme(),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          foregroundColor: Colors.white,
          backgroundColor: Colors.red
        )
      ),
      home: MyHomePage(),
          );
        }
      }
      
      class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    CounterBlock counterBlock = CounterBlock();
   return Scaffold(
      appBar: AppBar(
        title: Text("Counter Demo with BLoC"),
      ),
      floatingActionButton: Wrap(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:0,top:0,right:8,bottom:0),
            child: FloatingActionButton(child: Icon(Icons.add),
            onPressed: (){
              counterBlock.eventCounterSink.add(EventActions.INCREMENT);
            },),
          ),
          Padding(
            padding: const EdgeInsets.only(left:0,top:0,right:0,bottom:0),
            child: FloatingActionButton(child: Icon(Icons.remove),
            onPressed: (){
              counterBlock.eventCounterSink.add(EventActions.DECREMENT);
            },),
          ),
        ],
      ),
      body: Center(
        child: StreamBuilder(
          initialData: 0,
          stream: counterBlock.counterStream,
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
            return Text(snapshot.data.toString(),style: TextStyle(
            fontSize: 28,
          ),);
          }
        ),
      ),
    );
  }
 
}

