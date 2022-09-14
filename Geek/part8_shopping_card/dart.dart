class Meta {
  double price;
  String name;
  Meta(this.name, this.price);
}

class Item extends Meta {
  Item(name, price) : super(name, price);
  Item operator +(Item item) => Item(name + item.name, price + item.price);
}

class ShoppingCard extends Meta {
  String name;
  DateTime date;
  String code;
  List<Item> bookings = [];
  // double get price {
  //   double sum = 0;
  //   for (var book in bookings) {
  //     sum += book.price;
  //   }
  //   return sum;
  // }
  double get price =>
      bookings.reduce((value, element) => value + element).price;

  // ShoppingCard(this.name, this.code)
  //     : date = DateTime.now(),
  //       super(name, 0);

  ShoppingCard({name}) : this.withCode(name: name, code: null);

  ShoppingCard.withCode({name, required this.code})
      : date = DateTime.now(),
        super(name, 0);

  getInfo() => '''
购物车信息:
-----------------------------
  用户名: $name
  优惠码: $code
  总价: $price
  Date: $date
-----------------------------
''';
}
