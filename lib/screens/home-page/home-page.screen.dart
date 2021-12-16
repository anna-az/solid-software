// Flutter imports:
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:solid_software/models/color.model.dart';
import 'package:solid_software/screens/home-page/widgets/colors-list.widget.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  Color _randomColor = Colors.white;
  List<ColorModel> _listOfColors = <ColorModel>[];

  @override
  void initState() {
    _generateColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: _randomColor,
        body: Stack(
          alignment: Alignment.topRight,
          children: [
            InkWell(
                onTap: () => _generateColor(),
                child: Center(
                    child: Text('Hey there', style: TextStyle(fontSize: 24)))),
            ColorsListWidget(_listOfColors, _changeColor)
          ],
        ));
  }

  void _generateColor() {
    Color _nextColor;
    do {
      _nextColor = Colors.primaries[Random().nextInt(Colors.primaries.length)];
    } while (_nextColor == _randomColor);

    setState(() {
      _randomColor = _nextColor;
      if (!_listOfColors
          .any((ColorModel colorItem) => colorItem.color == _nextColor)) {
        _listOfColors.insert(0, ColorModel(_randomColor));
      }
    });
    _selectColor(_randomColor);
  }

  void _changeColor(Color color) {
    setState(() {
      _randomColor = color;
    });
    _selectColor(color);
  }

  void _selectColor(Color color) {
    _listOfColors.forEach((colorItem) {
      if (colorItem.color == color) {
        colorItem.isSelected = true;
      } else {
        colorItem.isSelected = false;
      }
    });
  }
}
