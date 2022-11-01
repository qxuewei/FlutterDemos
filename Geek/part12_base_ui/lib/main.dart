import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Base UI',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  // State<MyHomePage> createState() => _MyHomePageState();
  // State<MyHomePage> createState() => _TextState();
  // State<MyHomePage> createState() => _TextSpan();
  // State<MyHomePage> createState() => _Button();
  State<MyHomePage> createState() => _TableView();
}

class _Scroll extends State<MyHomePage> {

  late ScrollController _controller;
  bool isToTop = false;
   @override
  void initState() {
    // TODO: implement initState
    _controller = ScrollController();
    _controller.addListener(() {
      if(_controller.offset > 1000) {// 如果 ListView 已经向下滚动了 1000，则启用 Top 按钮
        setState(() {isToTop = true;});
      } else if(_controller.offset < 300) {// 如果 ListView 向下滚动距离不足 300，则禁用 Top 按钮
        setState(() {isToTop = false;});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

    );
  }

}


class _TableView extends State<MyHomePage> {

  final ListView simpleList = ListView(
      children: const <Widget>[
        ListTile(leading: Icon(Icons.map), title: Text("Map")),
        ListTile(leading: Icon(Icons.mail), title: Text("Mail")),
        ListTile(leading: Icon(Icons.message), title: Text("Message"))
  ]);

  final ListView horizontalList = ListView(
    scrollDirection: Axis.horizontal,
    itemExtent: 80,
    children: <Widget>[
      Container(color: Colors.blue,),
      Container(color: Colors.red,),
      Container(color: Colors.pink,),
      Container(color: Colors.yellow,),
      Container(color: Colors.black,),
      Container(color: Colors.grey,),
      Container(color: Colors.purple,),
      Container(color: Colors.green,),
    ],
  );

  final ListView builderList = ListView.builder(
      itemCount: 100,
      itemExtent: 64,
      itemBuilder: (BuildContext context, int index) => ListTile(title: Text("title $index"), subtitle: Text("body $index"))
  );

  final ListView separatedList = ListView.separated(
      itemBuilder:
          (BuildContext context, int index) =>
              ListTile(title: Text("title $index"), subtitle: Text("body $index")),
      separatorBuilder: (BuildContext context, int index) =>
              index % 2 == 0 ? const Divider(color: Colors.green) : const Divider(color: Colors.red),
      itemCount: 50);

  final CustomScrollView scrollView = CustomScrollView(
    slivers: [
      SliverAppBar(
        title: Text("CustomScrollView demo"),
        floating: true,// 设置悬浮样式
        flexibleSpace: Image.network("https://t7.baidu.com/it/u=1501242951,184012308&fm=193", fit: BoxFit.cover,),
        expandedHeight: 300,
      ),
      SliverList(delegate: SliverChildBuilderDelegate(
          (context, index) => ListTile(title: Text('Item #$index')),
        childCount: 80,
      ))
    ],
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(appBar: AppBar(
      title: Text("TableView"),
    ),
    body: scrollView);
  }

}


class _Button extends State<MyHomePage> {

  final ButtonStyle flatButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.grey[300], minimumSize: Size(88, 36),
    padding: EdgeInsets.symmetric(horizontal: 16.0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Demo"),
      ),
      body: TextButton(
        style: flatButtonStyle,
        onPressed: () => print("Click..."),
        child: Text('TextButton'),
      ),
    );
  }

}

class _TextSpan extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    TextStyle blackStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black);
    TextStyle redStyle = TextStyle(fontWeight: FontWeight.normal, fontSize: 23, color: Colors.red);
    return Scaffold(
        appBar: AppBar(
          title: Text("Base UI"),
        ),
        body: Text.rich(TextSpan(children: <TextSpan>[
          TextSpan(text: "文本是视图系统中常见的控件，它用来显示一段特定样式的字符串，类似", style: redStyle),
          TextSpan(text: "Android 里的 TextView", style: blackStyle,),
          TextSpan(text: "或者", style: redStyle,),
          TextSpan(text: "iOS 中的 UILabel。", style: blackStyle,),
        ]),
        textAlign: TextAlign.center,)
    );
  }
  
}

class _TextState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Base UI"),
      ),
      body: const Text("文本是视图系统中的常见控件，用来显示一段特定样式的字符串，就比如 Android 里的 TextView，或是 iOS 中的 UILabel。",
          textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.red),),
    );
  }

}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
