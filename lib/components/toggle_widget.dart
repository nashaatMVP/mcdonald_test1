import 'package:flutter/material.dart';


/// toggle
class DrinkToggle extends StatefulWidget {
  @override
  _DrinkToggleState createState() => _DrinkToggleState();
}

class _DrinkToggleState extends State<DrinkToggle> {
  bool isIced = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(
        children: [
          _buildToggleOption("Hot", !isIced),
          _buildToggleOption("Iced", isIced),
        ],
      ),
    );
  }
  Widget _buildToggleOption(String label, bool selected) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isIced = label == "Iced";
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 800),
          curve: Curves.easeIn,
          padding: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(40),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}


/// qty
class QuantitySelector extends StatefulWidget {
  @override
  _QuantitySelectorState createState() => _QuantitySelectorState();
}
class _QuantitySelectorState extends State<QuantitySelector> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 3, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildButton("-", () {
            if (quantity > 1) {
              setState(() {
                quantity--;
              });
            }
          }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "$quantity",
              style: TextStyle(fontSize: 18),
            ),
          ),
          _buildButton("+", () {
            setState(() {
              quantity++;
            });
          }),
        ],
      ),
    );
  }

  Widget _buildButton(String label, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        label,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
      ),
    );
  }
}

