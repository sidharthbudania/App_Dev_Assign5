import 'package:flutter/material.dart';

class AvailableColor extends StatefulWidget {
  const AvailableColor({Key? key}):super(key: key);

  @override
  State<AvailableColor> createState() => _AvailableColorState();
}

class _AvailableColorState extends State<AvailableColor> {
  bool isSelected=false;
  @override
  Widget build(BuildContext context)=> GestureDetector(
    onTap: () {
      setState(() {
        isSelected=!isSelected;
      });
    },
    child: Container(
      margin: const EdgeInsets.only(right: 16),
      width: 40,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: isSelected ? Colors.black87 : Colors.black),
      ),
      
      ),

  );
}