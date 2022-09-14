main() {
    String name = 
"""
qiuxuewei
ioser
""";
    printName(name);

    var arr1 = ["qiuxuewei", "wangkehui", "qiushuyu"];
    arr1.add("qiuxx");
    var arr2 = List.of([1,2,3]);
    arr2.add(4);
    arr1.forEach((element) => print("$element"));

    Map map1 = <String, String>{"name" : "qiuxuewei", "age" : "29"};
    var type = map1.runtimeType;
    map1.forEach((key, value) => print("key is $key, value is $value, map1.runtimeType is $type"));

}

printName(String name) {
    print('Hello World, My name is $name');
}