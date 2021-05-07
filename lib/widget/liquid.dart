import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';
import 'package:liquid/model/home_model.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class Liquid extends StatelessWidget {
  final AnimationController controller;
  final bool isFlipped;

  Liquid({Key key, this.controller, this.isFlipped}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final double height = 200;
    final model = Provider.of<HomeModel>(context);
    return Center(
      child: AnimatedContainer(
          height: height,
          duration: Duration(milliseconds: 2000),
          curve: Curves.elasticOut,
          transform: Matrix4.identity()
            ..translate(0.0,
                isFlipped ? -model.openValue - 100 : model.openValue + 100),
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Transform(
                transform: Matrix4.identity()
                  ..scale(1.0, isFlipped ? -1.0 : 1.0)
                  ..translate(0.0, isFlipped ? -height * 2 + 50 : -height + 50),
                child: Lottie.asset('assets/liquid.json',
                    animate: false,
                    controller: controller,
                    height: height,
                    delegates: LottieDelegates(values: [
                      ValueDelegate.color(const ['**', 'Rectangle 1', 'Fill 1'],
                          value: Colors.amber),
                      ValueDelegate.color(const ['**', 'Shape 1', 'Fill 1'],
                          value: Colors.amber),
                    ])),
              ),
              isFlipped
                  ? SizedBox()
                  : Container(
                      child: GestureDetector(
                        onTap: () {
                          model.openLiquidMenu(controller);
                        },
                        child: ClayContainer(
                            color: Colors.amber,
                            height: 88,
                            width: 88,
                            // emboss: model.isOpening,
                            curveType: model.isOpening
                                ? CurveType.concave
                                : CurveType.none,
                            child: Consumer<HomeModel>(
                              builder: (context, value, child) {
                                return Icon(
                                  value.isOpening
                                      ? Icons.lock_open
                                      : Icons.lock,
                                  color: Colors.pinkAccent,
                                );
                              },
                            )),
                      ),
                    ),
            ],
          )),
    );
  }
}
