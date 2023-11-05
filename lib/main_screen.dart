import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:police/model/item.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Item> itemsList = [
    Item(
        name: "Fruit 1",
        price: 1.2,
        image:
            "https://exoticfruits.co.uk/cdn/shop/products/passionfruit-exoticfruitscouk-270048.jpg?v=1645488927"),
    Item(
        name: "babaya",
        price: 0.3,
        image:
            "https://www.freshco.com.sg/cdn/shop/products/Papaya.jpg?v=1586842607"),
    Item(
        name: "banana",
        price: 2.6,
        image:
            "https://static.libertyprim.com/files/familles/banane-large.jpg?1569271725"),
    Item(
        name: "Mango",
        price: 4.9,
        image: "https://www.svz.com/wp-content/uploads/2018/05/Mango.jpg"),
    Item(
        name: "apple",
        price: 3.1,
        image:
            "https://static.libertyprim.com/files/familles/pomme-large.jpg?1569271834"),
    Item(
        name: "dragon",
        price: 6.0,
        image: "https://www.color-meanings.com/wp-content/uploads/Pitaya.jpeg"),
  ];

  int totcnt = 0;
  double totprice = 0;

  int getitemcnt(List<Item> items) {
    int ee = 0;

    for (var i = 0; i < items.length; i++) {
      if (items[i].qty > 0) {
        ee = items[i].qty + ee;
      }
    }

    return ee;
  }

  double getitempricet(List<Item> items) {
    double ss = 0;

    for (var i = 0; i < items.length; i++) {
      if (items[i].qty > 0) {
        ss = (items[i].qty * items[i].price) + ss;
      }
    }

    return ss;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping App"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: itemsList.length,
                itemBuilder: (context, index) {
                  return tile(
                    context: context,
                    item: itemsList[index],
                  );
                }),
          ),
          Container(
            height: 100,
            color: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Row(
                children: [
                  footer(
                      title: "# of Item In Cart",
                      value: getitemcnt(itemsList).toString()),
                  Expanded(child: Container()),
                  footer(
                      title: "Total Price ALL",
                      value: getitempricet(itemsList).toString())
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget footer({required String title, required String value}) {
    return Column(
      children: [
        Text(title),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    );
  }

  Widget tile({required BuildContext context, required Item item}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 56,
        width: MediaQuery.of(context).size.width,
        color: Colors.grey[200],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Image.network(item.image, width: 50, height: 50),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Column(
                  children: [
                    Text(item.name),
                    Text("${item.price} JD"),
                  ],
                ),
              ),
              Expanded(child: Container()),
              IconButton(
                  onPressed: () {
                    if (item.qty == 0) {
                      return;
                    }
                    item.qty = item.qty - 1;
                    setState(() {});
                  },
                  icon: const Icon(Icons.remove)),
              Text(item.qty.toString()),
              IconButton(
                  onPressed: () {
                    item.qty = item.qty + 1;
                    setState(() {});
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
        ),
      ),
    );
  }
}
