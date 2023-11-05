class Item {
  final String image;
  final String name;
  final double price;
  int qty;

  Item({required this.image, required this.name, required this.price, this.qty = 0});
}
