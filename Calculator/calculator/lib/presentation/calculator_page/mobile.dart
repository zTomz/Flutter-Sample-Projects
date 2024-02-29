import 'package:calculator/calculation_notifier.dart';
import 'package:calculator/calculator_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileCalculatorPage extends StatefulWidget {
  const MobileCalculatorPage({super.key});

  @override
  State<MobileCalculatorPage> createState() => _MobileCalculatorPageState();
}

class _MobileCalculatorPageState extends State<MobileCalculatorPage> {
  String calculation = "";
  String result = "";

  List<CalculatorButton> buttons = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    buttons = [
      CalculatorButton.clear(context),
      CalculatorButton.delete(context),
      CalculatorButton.operator("%", context),
      CalculatorButton.operator("/", context),
      CalculatorButton.number("7", context),
      CalculatorButton.number("8", context),
      CalculatorButton.number("9", context),
      CalculatorButton.operator("x", context),
      CalculatorButton.number("4", context),
      CalculatorButton.number("5", context),
      CalculatorButton.number("6", context),
      CalculatorButton.operator("-", context),
      CalculatorButton.number("1", context),
      CalculatorButton.number("2", context),
      CalculatorButton.number("3", context),
      CalculatorButton.operator("+", context),
      CalculatorButton.number(".", context),
      CalculatorButton.number("0", context),
      CalculatorButton.number("^", context),
      CalculatorButton.equal(context),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32),
              color: Theme.of(context).colorScheme.background,
              alignment: Alignment.centerRight,
              child: Consumer(
                builder: (context, CalculationProvider calculationProvider, _) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        calculationProvider.calculation,
                        textAlign: TextAlign.right,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 5,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                      ),
                      const SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Text(
                          calculationProvider.result.endsWith('.0')
                              ? calculationProvider.result
                                  .replaceFirst('.0', '')
                              : calculationProvider.result,
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.width / 4) * 5,
            color: Theme.of(context).colorScheme.secondary,
            child: GridView.builder(
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemCount: buttons.length,
              itemBuilder: (BuildContext context, int index) {
                final calculatorButton = buttons[index];

                return MaterialButton(
                  onPressed: () => calculatorButton.onPressed(context),
                  padding: EdgeInsets.zero,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.background,
                      ),
                    ),
                    child: Text(
                      calculatorButton.text,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                color: calculatorButton.color,
                              ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}