import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:part11_lifecycle/Page2.dart';

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Page1State();
  }
}

class _Page1State extends State<Page1> with WidgetsBindingObserver {

  //当Widget第一次插入到Widget树时会被调用。对于每一个State对象，Flutter只会调用该回调一次
  @override
  void initState() {
    super.initState();
    print("Page1 initState...");
    WidgetsBinding.instance.addObserver(this);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        print("单次Frame绘制回调");//只回调一次
    });

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
       print("实时Frame绘制回调");//每帧都回调
    });
  }

  @override
  void setState(fn) {
    super.setState(fn);
    print("page1 setState......");
  }

  /*
  初始化时，在initState之后立刻调用
  当State的依赖关系发生变化时，会触发此接口被调用
   */
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("page1 didChangeDependecies...");
  }

  // 绘制界面
  @override
  Widget build(BuildContext context) {
    print("page1 build...");

    return Scaffold(
      appBar: AppBar(title: Text("Lifecycle")),
      body: Center(
        child: Column(
          children: <Widget>[
            ElevatedButton(onPressed: btnClick,
                child: Text("打开/关闭新页面查看状态变化"))
          ],
        ),
      ),
    );

  }

  // 状态改变的时候会调用该方法，比如父类调用 setState
  @override
  void didUpdateWidget(covariant Page1 oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("page1 didUpdateWidget...");
  }

  // 当State对象从树中被移除时
  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('page1 deactivate......');
  }

  // 当State对象从树中被永久移除时，释放资源
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("page1 disponse...");

    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    print("didChangeAppLifecycleState  $state");

  }

  void btnClick() {
    print("btnClick");
    Navigator.push(context, MaterialPageRoute(builder: (context) => Page2Page()));
  }
}