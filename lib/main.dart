import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String publicKey ="pk_test_QQ6EqdeL67aoCecNqLETZVke00kNCuIBte";
  String secretKey ="sk_test_EIn7PcMgJCh005IxqH1Kmmn600n4wtSOKC";


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: const Text('Paiement Stripe B3'),
      ),
      body: const Center(

        child: Text('Stripe')
      ),
// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
