import 'package:bmi_starting/reusable_card.dart';
import 'package:bmi_starting/theme.dart';
import 'package:flutter/material.dart';

import 'brain.dart';

class ResultPage extends StatefulWidget {
  final int height;
  final int weight;
  const ResultPage({
    super.key,
    required this.height,
    required this.weight,
  });

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late Brain brain;

  @override
  void initState() {
    brain = Brain(height: widget.height, weight: widget.weight);
    brain.calcBMI();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YOUR RESULT'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ReusableCard(
            bgColor: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  brain.getResult().toUpperCase(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                Text(
                  brain.calcBMI(),
                  style: const TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  brain.getInterpret(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () => Navigator.pop(context),
            label: 'RE-CALCULATE YOUR BMI',
          ),
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.onTap,
    required this.label,
  });
  final Function() onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: kPrimaryColor,
        width: double.infinity,
        height: 80,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
