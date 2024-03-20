import 'package:flutter/material.dart';
import 'package:pizza_app/utils/data.dart';

class PizzaSize extends StatefulWidget {
  const PizzaSize({
    super.key,
  });

  @override
  State<PizzaSize> createState() => _PizzaSizeState();
}

class _PizzaSizeState extends State<PizzaSize> {
  int selectedSized = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var i = 0; i < pizzaSizes.length; i++)
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: const Size(40, 55),
                padding: const EdgeInsets.all(1),
                backgroundColor: selectedSized == i
                    ? const Color(0xFFB4E0FB)
                    : Colors.transparent,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))),
                side: BorderSide(
                    color: selectedSized == i
                        ? Colors.transparent
                        : Colors.grey[300]!,
                    width: 1),
              ),
              onPressed: () {
                setState(() {
                  selectedSized = i;
                });
              },
              child: Text(
                pizzaSizes[i],
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: selectedSized == i
                        ? Colors.grey[800]!
                        : Colors.grey[300]!),
              ),
            ),
          ),
      ],
    );
  }
}
