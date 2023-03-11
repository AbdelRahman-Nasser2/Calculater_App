abstract class CalculatorStates {}

class CalculatorInitialState extends CalculatorStates {
  final int result;

  CalculatorInitialState(this.result);
}

class CalculatorResult extends CalculatorStates {
  final dynamic result;

  CalculatorResult(this.result);
}

class CalculateError extends CalculatorStates {
  String error;
  CalculateError(this.error);
}
