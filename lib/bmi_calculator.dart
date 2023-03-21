import 'package:flutter/material.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  int _selectedIndex = 0;
  double _height = 150;
  double _weight = 50;

  void _onGenderSelected(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onHeightChanged(double value) {
    setState(() {
      _height = value;
    });
  }

  void _onWeightChanged(double value) {
    setState(() {
      _weight = value;
    });
  }

  void _onSubmit() {
    double bmi = _weight / ((_height / 100) * (_height / 100));
    String result = _getResultText(bmi);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('BMI Result'),
        content: Text(result),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  String _getResultText(double bmi) {
    String result;
    if (bmi < 18.5) {
      result = 'Underweight (BMI: ${bmi.toStringAsFixed(1)})';
    } else if (bmi < 25) {
      result = 'Normal (BMI: ${bmi.toStringAsFixed(1)})';
    } else if (bmi < 30) {
      result = 'Overweight (BMI: ${bmi.toStringAsFixed(1)})';
    } else {
      result = 'Obese (BMI: ${bmi.toStringAsFixed(1)})';
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 16),
          const Text(
            'Gender',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          ToggleButtons(
            isSelected: [_selectedIndex == 0, _selectedIndex == 1],
            onPressed: _onGenderSelected,
            selectedColor: Theme.of(context).colorScheme.secondary,
            children: const [
              Icon(Icons.female),
              Icon(Icons.male),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'Height (cm)',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          Slider(
            value: _height,
            min: 100,
            max: 250,
            onChanged: _onHeightChanged,
          ),
          Text(
            '${_height.toStringAsFixed(0)} cm',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 16),
          const Text(
            'Weight (kg)',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 8),
          Slider(
            value: _weight,
            min: 30,
            max: 150,
            onChanged: _onWeightChanged,
          ),
          Text(
            '${_weight.toStringAsFixed(0)} kg',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
              onPressed: () {
                _onSubmit();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).colorScheme.secondary,
                ),
              ),
              child: const Text('Calculate BMI')),
        ],
      ),
    );
  }
}
