import 'package:calculator_app/shared/cubit/states.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorCubit extends Cubit<CalculatorStates> {
  CalculatorCubit() : super(CalculatorInitialState(0));
  // TODO: implement initialState
  CalculatorStates get initialState {
    return CalculatorInitialState(0);
  }

  static CalculatorCubit get(context) => BlocProvider.of(context);

  final inputController = TextEditingController();
  final outController = TextEditingController(text: '0');

  void calculate() {
    String finaluserinput = inputController.text;
    finaluserinput = inputController.text.replaceAll('x', '*');
    if (inputController.text == '0' || inputController.text == '') {
      outController.text = '0';
    } else {
      try {
        Parser p = Parser();
        Expression exp = p.parse(finaluserinput);
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        outController.text = eval.toString();

        emit(CalculatorResult(outController.text));
        if (kDebugMode) {
          print(outController.text);
        }
      } catch (e) {
        outController.text = 'Error';
        if (kDebugMode) {
          print(e.toString());
        }
        emit(CalculateError(e.toString()));
      }
    }
  }
}
