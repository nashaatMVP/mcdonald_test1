import 'package:flutter/material.dart';
import 'package:mcdonald_test/components/drink.dart';
import 'package:mcdonald_test/details.dart';
import 'package:mcdonald_test/model.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(height: 60),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Menu",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500)),
                  Image.asset("assets/cart.png",width: 25),
                ],
              ),
            ),

            SizedBox(height: 30),

            Expanded(
              child: ListView.builder(
              padding: EdgeInsets.zero,
              controller: controller,
              itemCount: DrinkModel.drinks.length,
              itemBuilder: (context,index) {
                final drink = DrinkModel.drinks[index];
                return AnimatedBuilder(
                  animation: controller,
                  builder: (context, child) {
                    double offset = 0;
                    if(controller.hasClients) {
                      offset = controller.offset / 100 - index;
                    }
                    offset = offset.clamp(0, 1);
                    return Transform.scale(
                      scale: 1 - (offset * 0.2),
                      child: GestureDetector(
                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (c) => DrinkDetails())),
                        child: Drink(
                          name: drink.name,
                          title: drink.title,
                          image: drink.image,
                        ),
                      ),
                    );
                  },
                );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
