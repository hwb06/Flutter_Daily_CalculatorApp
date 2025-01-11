import 'package:flutter/material.dart';
import '../ widgets/calculator_button.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _input = '';
  String _output = '';
  String _operation = '';
  double _num1 = 0;
  bool _newNumber = true;

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        _input = '';
        _output = '';
        _operation = '';
        _num1 = 0;
        _newNumber = true;
      } else if (buttonText == '+/-') {
        if (_input.startsWith('-')) {
          _input = _input.substring(1);
        } else {
          _input = '-$_input';
        }
      } else if (buttonText == '%') {
        double number = double.parse(_input);
        _input = (number / 100).toString();
      } else if (buttonText == '÷' || buttonText == '×' ||
          buttonText == '-' || buttonText == '+') {
        _num1 = double.parse(_input);
        _operation = buttonText;
        _newNumber = true;
        _output = '$_input $_operation';
        _input = '';
      } else if (buttonText == '=') {
        double num2 = double.parse(_input);
        double result = 0;

        switch (_operation) {
          case '+':
            result = _num1 + num2;
            break;
          case '-':
            result = _num1 - num2;
            break;
          case '×':
            result = _num1 * num2;
            break;
          case '÷':
            result = _num1 / num2;
            break;
        }

        _input = result.toString();
        _output = '$_num1 $_operation $num2 =';
        _operation = '';
      } else if (buttonText == '.') {
        if (!_input.contains('.')) {
          _input = _input + buttonText;
        }
      } else {
        if (_newNumber) {
          _input = buttonText;
          _newNumber = false;
        } else {
          _input = _input + buttonText;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Transparent background
        elevation: 0, // Removes shadow
        title: Column(
          mainAxisSize: MainAxisSize.min, // Ensures the column doesn't take full height
          children: [
            SizedBox(height: 5,),
            Text(
              'Devop. By:',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold, // Bold text for "Devops By:"
                fontSize: 20,
              ),
            ),
            SizedBox(height: 5,),
            Text(
              'Mr. Hussnain Waheed',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal, // Normal text for "Hussnain Waheed"
                fontSize: 18,
              ),
            ),
          ],
        ),
        centerTitle: true, // Ensures the title is centered
      ),

      backgroundColor: const Color(0xFF17171C),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0F2E9),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        _output,
                        style: const TextStyle(
                          fontSize: 24,
                          color: Color(0xFF747477),
                        ),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _input.isEmpty ? '0' : _input,
                        style: const TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFFF),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalculatorButton(
                          text: 'C',
                          isFunction: true,
                          onPressed: _onButtonPressed,
                        ),
                        CalculatorButton(
                          text: '+/-',
                          isFunction: true,
                          onPressed: _onButtonPressed,
                        ),
                        CalculatorButton(
                          text: '%',
                          isFunction: true,
                          onPressed: _onButtonPressed,
                        ),
                        CalculatorButton(
                          text: '÷',
                          isOperator: true,
                          onPressed: _onButtonPressed,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalculatorButton(text: '7', onPressed: _onButtonPressed),
                        CalculatorButton(text: '8', onPressed: _onButtonPressed),
                        CalculatorButton(text: '9', onPressed: _onButtonPressed),
                        CalculatorButton(
                          text: '×',
                          isOperator: true,
                          onPressed: _onButtonPressed,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalculatorButton(text: '4', onPressed: _onButtonPressed),
                        CalculatorButton(text: '5', onPressed: _onButtonPressed),
                        CalculatorButton(text: '6', onPressed: _onButtonPressed),
                        CalculatorButton(
                          text: '-',
                          isOperator: true,
                          onPressed: _onButtonPressed,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalculatorButton(text: '1', onPressed: _onButtonPressed),
                        CalculatorButton(text: '2', onPressed: _onButtonPressed),
                        CalculatorButton(text: '3', onPressed: _onButtonPressed),
                        CalculatorButton(
                          text: '+',
                          isOperator: true,
                          onPressed: _onButtonPressed,
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CalculatorButton(
                          text: '0',
                          flex: 2,
                          onPressed: _onButtonPressed,
                        ),
                        CalculatorButton(text: '.', onPressed: _onButtonPressed),
                        CalculatorButton(
                          text: '=',
                          isOperator: true,
                          onPressed: _onButtonPressed,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}