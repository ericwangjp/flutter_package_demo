import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_package_demo/caculator.dart';
import 'package:flutter_package_demo/dialogs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'package 测试',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SafeArea(
          child: Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                title: const Text("package 测试"),
              ),
              body: const HomePage()),
        ));
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(value.toString(), textScaleFactor: 1.5),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  value = Calculator().addOne(value);
                });
              },
              child: const Text('+1')),
          showPackageDialog(context),
        ],
      ),
    );
  }

  Widget showPackageDialog(BuildContext context) {
    return MaterialButton(
      color: Colors.grey[300],
      minWidth: 300,
      onPressed: () => Dialogs.materialDialog(
          msg: '确认关闭？',
          title: "关闭",
          color: Colors.white,
          context: context,
          dialogWidth: kIsWeb ? 0.3 : null,
          onClose: (value) => debugPrint("返回值： '$value'"),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(['取消了', 'List']);
              },
              child: const Text('取消', style: TextStyle(color: Colors.black)),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.of(context).pop(['关闭了', 'List']);
              },
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: const Text('关闭', style: TextStyle(color: Colors.white)),
            ),
          ]),
      child: const Text("Show Material Dialog"),
    );
  }
}
