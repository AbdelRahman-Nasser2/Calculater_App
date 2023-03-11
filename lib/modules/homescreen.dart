import 'package:calculator_app/shared/cubit/cubit.dart';
import 'package:calculator_app/shared/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculatorCubit, CalculatorStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        CalculatorCubit cubit = CalculatorCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: const Text(
              'Calculator App',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.amber[700],
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Number Container
                Container(
                  margin: const EdgeInsetsDirectional.only(top: 20),
                  child: Column(children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      padding: const EdgeInsets.all(16.0),
                      color: Colors.white,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        controller: cubit.inputController,
                        onSubmitted: (value) {
                          cubit.calculate();
                        },
                        enabled: true,
                        textAlign: TextAlign.right,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          counterText: "",
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 60.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(16.0),
                      padding: const EdgeInsets.all(16.0),
                      color: Colors.white,
                      child: TextField(
                        controller: cubit.outController,
                        enabled: false,
                        textAlign: TextAlign.right,
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          counterText: "",
                        ),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 60.0,
                        ),
                      ),
                    ),
                  ]),
                ),

                Container(
                  margin: const EdgeInsetsDirectional.only(bottom: 0, top: 60),
                  child: Column(
                    children: [
                      // Clear Button and Divider Button
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              FloatingActionButton(
                                onPressed: () {
                                  cubit.inputController.text = "";
                                  cubit.outController.text = '0';
                                },
                                shape: const CircleBorder(),
                                child: const Text(
                                  'AC',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                              ),
                              FloatingActionButton(
                                clipBehavior: Clip.antiAlias,
                                onPressed: () {
                                  cubit.inputController.text =
                                      cubit.inputController.text.substring(
                                          0,
                                          cubit.inputController.text.length -
                                              1);
                                },
                                shape: const CircleBorder(),
                                child: Center(
                                  child: SvgPicture.asset(
                                    'assets/delete.svg',
                                    width: 40,
                                    height: 40,
                                    color: Colors.white,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                // const Text(
                                //   'DEL',
                                //   style: TextStyle(fontSize: 24.0),
                                // ),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  cubit.inputController.text += '(';
                                },
                                backgroundColor: Colors.amberAccent[700],
                                shape: const CircleBorder(),
                                child: const Text(
                                  '(',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  if (cubit.inputController.text == '' ||
                                      cubit.inputController.text == '0') {
                                    return;
                                  } else {
                                    cubit.inputController.text += ')';
                                  }
                                },
                                backgroundColor: Colors.amberAccent[700],
                                shape: const CircleBorder(),
                                child: const Text(
                                  ')',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  if (cubit.inputController.text == '' ||
                                      cubit.inputController.text == '0') {
                                    return;
                                  } else {
                                    cubit.inputController.text += '/';
                                  }
                                },
                                backgroundColor: Colors.amberAccent[700],
                                shape: const CircleBorder(),
                                child: const Text(
                                  '÷',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                              )
                            ]),
                      ),

                      //  Buttons 7,8,9, and Multiply Button
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              FloatingActionButton(
                                onPressed: () {
                                  if (cubit.inputController.text == '0') {
                                    cubit.inputController.text = '7';
                                  } else {
                                    cubit.inputController.text += '7';
                                  }
                                },
                                shape: const CircleBorder(),
                                child: const Text(
                                  '7',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  if (cubit.inputController.text == '0') {
                                    cubit.inputController.text = '8';
                                  } else {
                                    cubit.inputController.text += '8';
                                  }
                                },
                                shape: const CircleBorder(),
                                child: const Text(
                                  '8',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  if (cubit.inputController.text == '0') {
                                    cubit.inputController.text = '9';
                                  } else {
                                    cubit.inputController.text += '9';
                                  }
                                },
                                shape: const CircleBorder(),
                                child: const Text(
                                  '9',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  if (cubit.inputController.text == '' ||
                                      cubit.inputController.text == '0') {
                                    return;
                                  } else {
                                    cubit.inputController.text += 'x';
                                  }
                                },
                                backgroundColor: Colors.amberAccent[700],
                                shape: const CircleBorder(),
                                child: const Text(
                                  '×',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                              ),
                            ]),
                      ),

                      //  Buttons 4,5,6, and Subtract Button
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              FloatingActionButton(
                                onPressed: () {
                                  if (cubit.inputController.text == '0') {
                                    cubit.inputController.text = '4';
                                  } else {
                                    cubit.inputController.text += '4';
                                  }
                                },
                                shape: const CircleBorder(),
                                child: const Text(
                                  '4',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  if (cubit.inputController.text == '0') {
                                    cubit.inputController.text = '5';
                                  } else {
                                    cubit.inputController.text += '5';
                                  }
                                },
                                shape: const CircleBorder(),
                                child: const Text(
                                  '5',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  if (cubit.inputController.text == '0') {
                                    cubit.inputController.text = '6';
                                  } else {
                                    cubit.inputController.text += '6';
                                  }
                                },
                                shape: const CircleBorder(),
                                child: const Text(
                                  '6',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  if (cubit.inputController.text == '' ||
                                      cubit.inputController.text == '0') {
                                    return;
                                  } else {
                                    cubit.inputController.text += '-';
                                  }
                                },
                                backgroundColor: Colors.amberAccent[700],
                                shape: const CircleBorder(),
                                child: const Text(
                                  '-',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                              ),
                            ]),
                      ),

                      //  Buttons 1,2,3, and Add Button
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              FloatingActionButton(
                                onPressed: () {
                                  if (cubit.inputController.text == '0') {
                                    cubit.inputController.text = '1';
                                  } else {
                                    cubit.inputController.text += '1';
                                  }
                                },
                                shape: const CircleBorder(),
                                child: const Text(
                                  '1',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  if (cubit.inputController.text == '0') {
                                    cubit.inputController.text = '2';
                                  } else {
                                    cubit.inputController.text += '2';
                                  }
                                },
                                shape: const CircleBorder(),
                                child: const Text(
                                  '2',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  if (cubit.inputController.text == '0') {
                                    cubit.inputController.text = '3';
                                  } else {
                                    cubit.inputController.text += '3';
                                  }
                                },
                                shape: const CircleBorder(),
                                child: const Text(
                                  '3',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                              ),
                              FloatingActionButton(
                                onPressed: () {
                                  if (cubit.inputController.text == '' ||
                                      cubit.inputController.text == '0') {
                                    return;
                                  } else {
                                    cubit.inputController.text += '+';
                                  }
                                },
                                backgroundColor: Colors.amberAccent[700],
                                shape: const CircleBorder(),
                                child: const Text(
                                  '+',
                                  style: TextStyle(fontSize: 24.0),
                                ),
                              ),
                            ]),
                      ),

                      // Zero Button and Equal Button
                      Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 16.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Container(
                                  margin: const EdgeInsets.only(right: 4.0),
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      if (cubit.inputController.text == '0' ||
                                          cubit.inputController.text == '') {
                                        // cubit.inputController.text = '0';
                                      } else {
                                        cubit.inputController.text += '0';
                                      }
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(45)),
                                    child: const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '0',
                                        style: TextStyle(fontSize: 24.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsetsDirectional.symmetric(
                                    horizontal: 5),
                                child: FloatingActionButton(
                                  onPressed: () {
                                    cubit.inputController.text += '.';
                                  },
                                  shape: const CircleBorder(),
                                  child: const Text(
                                    '.',
                                    style: TextStyle(fontSize: 24.0),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  margin: const EdgeInsets.only(left: 4.0),
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      cubit.calculate();
                                    },
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(45)),
                                    child: const Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        '=',
                                        textAlign: TextAlign.end,
                                        style: TextStyle(fontSize: 24.0),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
