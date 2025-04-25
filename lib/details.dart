import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mcdonald_test/components/toggle_widget.dart';
import 'package:mcdonald_test/model.dart';

class DrinkDetails extends StatefulWidget {
  const DrinkDetails({super.key});

  @override
  State<DrinkDetails> createState() => _DrinkDetailsState();
}

class _DrinkDetailsState extends State<DrinkDetails> {
  final PageController _controller = PageController(viewportFraction: 0.50);
  double _currentPage = 0;
  int selectedIndex = 0;
  int? selectedSize;
  bool isSelectedSize = false;
  double drinkSize = 1.1;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page ?? 1;
      });
    });
  }
  final drinks = DrinkModel.drinks;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 80,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      drinks[_currentPage.round()].name,
                      style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                    Text(drinks[_currentPage.round()].title),
                  ],
                ),
                Text(
                  "£${drinks[_currentPage.round()].price}",
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          PageView.builder(
            controller: _controller,
            itemCount: drinks.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final scale = drinkSize - (_currentPage - index).abs() * 1;
              final translateY = (_currentPage - index).abs() * 400;
              return Transform.translate(
                offset: Offset(translateY, 0),
                child: Transform.scale(
                  scale: scale.clamp(0.5, 1.0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            drinks[index].image,
                            height: 900,
                          ),
                          Positioned(
                            bottom: 200,
                            right: 0,
                            left: 0,
                            child: Image.asset(
                              "assets/drinks/Ellipse 2.png",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              );
            },
          ),


          Positioned(
            left: 20,
            right: 20,
            bottom: 60,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(4, (index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSize = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: selectedSize == index ? Colors.orange : Colors.white,
                          border: Border.all(color: selectedSize == index ? Colors.orange : Colors.black),
                        ),
                        child: SvgPicture.asset(
                            "assets/Vector.svg",
                             color: selectedSize == index ? Colors.white : Colors.black,
                        ),
                      ),
                    );
                  },
                 ),
                ),
                SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(child: DrinkToggle()),
                    SizedBox(width: 40),
                    Expanded(child: QuantitySelector()),
                  ],
                ),
              ],
            ),


          ),
        ],
      ),
    );
  }
}
