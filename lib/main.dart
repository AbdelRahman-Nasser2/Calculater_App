import 'package:calculator_app/shared/cubit/cubit.dart';
import 'package:calculator_app/shared/cubit/states.dart';
import 'package:calculator_app/modules/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CalculatorCubit(),
      child: BlocConsumer<CalculatorCubit, CalculatorStates>(
          listener: (BuildContext context, CalculatorStates state) {},
          builder: (BuildContext context, CalculatorStates state) {
            return const MaterialApp(
              debugShowCheckedModeBanner: false,
              home: HomeScreen(),
            );
          }),
    );
  }
}
