class DrinkModel {

  final String image;
  final String name;
  final String title;
  final String price;
  final double? height;
  final double? rightOffset;
  final double? leftOffset;

  DrinkModel({
    required this.image,
    required this.name,
    required this.title,
    required this.price,
    this.height,
    this.leftOffset,
    this.rightOffset,
});

  static List<DrinkModel> drinks = [

    DrinkModel(
      image: "assets/drinks/Banana.png",
      name: "Banana",
      title: "20 Cups of different flavours",
      price: "23",
    ),

    DrinkModel(
      image: "assets/drinks/Salted Caramel.png",
      name: "Milkshake",
      title: "20 Cups of different flavours",
      price: "20",
    ),

    DrinkModel(
      image: "assets/drinks/Chocolate.png",
      name: "Chocolate Drinks",
      title: "20 Cups of different flavours",
      price: "10",
    ),

    DrinkModel(
      image: "assets/drinks/Strawberry.png",
      name: "Strawberry",
      title: "3 Cups of different flavours",
      price: "40",
    ),

    DrinkModel(
      image: "assets/drinks/Banana.png",
      name: "Banana",
      title: "20 Cups of different flavours",
      price: "23",
    ),

    DrinkModel(
      image: "assets/drinks/Salted Caramel.png",
      name: "Milkshake",
      title: "20 Cups of different flavours",
      price: "20",
    ),

    DrinkModel(
      image: "assets/drinks/Chocolate.png",
      name: "Chocolate Drinks",
      title: "20 Cups of different flavours",
      price: "10",
    ),

    DrinkModel(
      image: "assets/drinks/Strawberry.png",
      name: "Strawberry",
      title: "3 Cups of different flavours",
      price: "40",
    ),

    DrinkModel(
      image: "assets/drinks/Salted Caramel.png",
      name: "Milkshake",
      title: "20 Cups of different flavours",
      price: "20",
    ),

  ];
}

