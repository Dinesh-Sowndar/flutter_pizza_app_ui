import 'package:flutter/material.dart';
import 'package:pizza_app/utils/data.dart';
import 'package:pizza_app/widgets/bottom_rounded_clipper.dart';
import 'package:pizza_app/widgets/order_button.dart';
import 'package:pizza_app/widgets/pizza_details.dart';
import 'package:pizza_app/widgets/pizza_size.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _titleSlideController = PageController();
  final PageController _imageSlideController = PageController(
    viewportFraction: 0.70,
  );
  final PageController _detailsSlideController = PageController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 100), () {
      _imageSlideController.animateToPage(1,
          duration: const Duration(milliseconds: 400), curve: Curves.linear);
    });
    _imageSlideController.addListener(() {
      _titleSlideController.jumpTo(_imageSlideController.offset * 0.148);
      _detailsSlideController.jumpTo(_imageSlideController.offset * 0.5621);
    });
  }

  @override
  void dispose() {
    _titleSlideController.dispose();
    _imageSlideController.dispose();
    _detailsSlideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: BottomRoundedClipper(),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 450,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                SafeArea(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset(
                            "assets/images/menu.png",
                            width: 32,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 45,
                        child: PageView.builder(
                          itemCount: pizzaList.length,
                          controller: _titleSlideController,
                          scrollDirection: Axis.vertical,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Text(
                              pizzaList[index].name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 320,
                        child: AnimatedBuilder(
                            animation: _imageSlideController,
                            builder: (context, child) {
                              return PageView.builder(
                                itemCount: pizzaList.length,
                                controller: _imageSlideController,
                                onPageChanged: (page) {},
                                itemBuilder: (context, index) {
                                  double value = 0.0;

                                  if (_imageSlideController
                                      .position.haveDimensions) {
                                    value = index.toDouble() -
                                        (_imageSlideController.page ?? 0);
                                    value = (value * 0.7).clamp(-1, 1);
                                  }

                                  return Align(
                                    alignment: Alignment.topCenter,
                                    child: Transform.translate(
                                      offset:
                                          Offset(0, 10 + (value.abs() * 40)),
                                      child: Transform.scale(
                                        scale: 1 - (value.abs() * 0.4),
                                        child: Transform.rotate(
                                          angle: value * 5,
                                          child: Image.asset(
                                            pizzaList[index].image,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 310,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            }),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedBuilder(
                        animation: _detailsSlideController,
                        builder: (context, child) {
                          return SizedBox(
                            height: 170,
                            child: PageView.builder(
                              itemCount: pizzaList.length,
                              controller: _detailsSlideController,
                              scrollDirection: Axis.vertical,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                double value = 0.0;

                                if (_detailsSlideController
                                    .position.haveDimensions) {
                                  value = index.toDouble() -
                                      (_detailsSlideController.page ?? 0);
                                  value = (value * 0.9);
                                }

                                return Opacity(
                                  opacity: 1 - value.abs(),
                                  child: PizzaDetails(
                                    pizzaDetails: pizzaList[index],
                                  ),
                                );
                              },
                            ),
                          );
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    const PizzaSize(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const OrderButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
