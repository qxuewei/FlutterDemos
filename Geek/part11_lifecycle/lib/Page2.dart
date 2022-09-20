import 'package:flutter/material.dart';

/**
 * @author[qiuxuewei]
 * @version[创建日期，2022/9/20 15:10]
 * @function[功能简介 ]
 **/
class Page2Page extends StatefulWidget {
  const Page2Page({Key? key}) : super(key: key);

  @override
  _Page2PageState createState() => _Page2PageState();
}

class _Page2PageState extends State<Page2Page> {
  int _counter = 0;

  // 当Widget 第一次插入到Widget树时被调用，对于每一个State对象，Flutter只会调用该回调一次
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("page2 initState...");
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    print("page2 setState...");
  }

  /*
  初始化时，在initState之后立即调用，当State的依赖关系发生变化时，会触发此接口被调用
   */
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("page2 didChangeDependencies...");
  }

  // 绘制界面
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("SetState Demo"),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                _counter++;
              });
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.blue,
              onPrimary: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              elevation: 16,
              padding: EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 100,
              ),
            ),
            child: Child(count: _counter),
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // 状态改变时调用，比如父类调用了 setState
  @override
  void didUpdateWidget(covariant Page2Page oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("page2 didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("paeg2 deactivate...");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("page2 dispose...");
  }

}

class Child extends StatefulWidget {
  final int count;
  const Child({Key? key, required this.count}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChildState();
}

class _ChildState extends State<Child> {
  // 绘制UI
  @override
  Widget build(BuildContext context) {
    print("child build...");
    return Text("点击按钮查看状态变化 count: ${widget.count}");
  }

  //当Widget第一次插入到Widget树时会被调用。对于每一个State对象，Flutter只会调用该回调一次
  @override
  void initState() {
    super.initState();
    print("page2 child initState......");
  }


  /*
  *初始化时，在initState之后立刻调用
  *当State的依赖关系发生变化时，会触发此接口被调用
  */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("page2 child didChangeDependencies......");
  }

  //状态改变的时候会调用该方法,比如父类调用了setState
  @override
  void didUpdateWidget(Child oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("page2 child didUpdateWidget......");
  }

  //当State对象从树中被移除时，会调用此回调
  @override
  void deactivate() {
    super.deactivate();
    print('page2 child deactivate......');
  }

  //当State对象从树中被永久移除时调用；通常在此回调中释放资源
  @override
  void dispose() {
    super.dispose();
    print('page2 child dispose......');
  }

}
