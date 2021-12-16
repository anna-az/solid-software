import 'package:flutter/material.dart';
import 'package:solid_software/models/color.model.dart';

class ColorsListWidget extends StatelessWidget {
  const ColorsListWidget(this.listOfColors, this.changeColor);
  final List<ColorModel> listOfColors;
  final Function(Color) changeColor;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: SizedBox(
            width: 70,
            child: Column(children: <Widget>[
              const SizedBox(height: 15),
              Text('List of colors', textAlign: TextAlign.center),
              const SizedBox(height: 15),
              Expanded(
                  child: ListView(
                      padding: const EdgeInsets.only(bottom: 50),
                      children: [
                    ...listOfColors.map((ColorModel colorItem) =>
                        GestureDetector(
                            onTap: () => changeColor(colorItem.color),
                            child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                    height: 40,
                                    width: 40,
                                    margin: const EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                        color: colorItem.color,
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                              spreadRadius: 5,
                                              blurRadius: 10,
                                              offset: const Offset(0, 5))
                                        ],
                                        border: Border.all(
                                            color: colorItem.isSelected
                                                ? Colors.red
                                                : Colors.white,
                                            width: 3))))))
                  ]))
            ])));
  }
}
