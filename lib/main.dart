import 'package:bmi_starting/result_page.dart';
import 'package:bmi_starting/reusable_card.dart';
import 'package:bmi_starting/theme.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: const InputPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 170;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Flex(
        direction: Axis.vertical,
        children: [
          ReusableCard(
            bgColor: false,
            child: Flex(
              direction: Axis.horizontal,
              children: [
                ReusableCard(
                  margin: false,
                  bg: selectedGender == Gender.male ? kPrimaryColor : null,
                  onTap: () => setState(() => selectedGender = Gender.male),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.mars, size: 80),
                      SizedBox(height: 10),
                      Text(
                        "MALE",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                ReusableCard(
                  margin: false,
                  bg: selectedGender == Gender.female ? kPrimaryColor : null,
                  onTap: () => setState(() => selectedGender = Gender.female),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(FontAwesomeIcons.venus, size: 80),
                      SizedBox(height: 10),
                      Text(
                        "FEMALE",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          ReusableCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Height", style: Theme.of(context).textTheme.bodySmall),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text("$height", style: const TextStyle(fontSize: 50)),
                    const Text("cm", style: TextStyle(fontSize: 20)),
                  ],
                ),
                const SizedBox(height: 8),
                Slider(
                  value: height.toDouble(),
                  min: 120,
                  max: 220,
                  onChanged: (value) => setState(() => height = value.toInt()),
                ),
              ],
            ),
          ),
          ReusableCard(
            bgColor: false,
            child: Flex(
              direction: Axis.horizontal,
              children: [
                ReusableCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Weight",
                          style: Theme.of(context).textTheme.bodySmall),
                      Text(
                        "$weight",
                        style: const TextStyle(fontSize: 50),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: null,
                            mini: true,
                            onPressed: () => setState(() => weight--),
                            child: const Icon(Icons.remove),
                          ),
                          const SizedBox(width: 12),
                          FloatingActionButton(
                            heroTag: null,
                            mini: true,
                            onPressed: () => setState(() => weight++),
                            child: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                ReusableCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Age", style: Theme.of(context).textTheme.bodySmall),
                      Text("$age", style: const TextStyle(fontSize: 50)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: null,
                            mini: true,
                            onPressed: () => setState(() => age--),
                            child: const Icon(Icons.remove),
                          ),
                          const SizedBox(width: 12),
                          FloatingActionButton(
                            mini: true,
                            heroTag: null,
                            onPressed: () => setState(() => age++),
                            child: const Icon(Icons.add),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ReusableCard(
            flex: 1,
            bgColor: false,
            child: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          ResultPage(height: height, weight: weight),
                    ),
                  );
                },
                child: Text("Calculate your BMI".toUpperCase()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

enum Gender { male, female }
