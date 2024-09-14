import 'package:covid19/models/WorldCovidAttacktModel.dart';
import 'package:covid19/services/utilites/stateServices.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldScreen extends StatefulWidget {
  const WorldScreen({super.key});

  @override
  State<WorldScreen> createState() => _WorldScreenState();
}

class _WorldScreenState extends State<WorldScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();
  @override
  void initState() {
    Stateservices.covidstaterecord();
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final colorLIst = [
    const Color(0xFF4264f4),
    const Color(0xFF1aa260),
    const Color(0xFFde5246),
  ];

  @override
  Widget build(BuildContext context) {
    Stateservices stateservices = Stateservices();

    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              SizedBox(
                height: size.height * .1,
              ),
              FutureBuilder(
                future: Stateservices.covidstaterecord(),
                builder:
                    (context, AsyncSnapshot<Worldcovidattacktmodel> snapshot) {
                  if (snapshot.hasData) {
                    return  Column(
                      children: [
                        PieChart(
                          dataMap: {
                            "Total":
                            double.parse(snapshot.data!.cases.toString()),
                          },
                          centerText: " C-19 ",
                          centerTextStyle: const TextStyle(
                              fontSize: 40,
                              backgroundColor: Colors.white,
                              color: Colors.black),
                          legendOptions: const LegendOptions(
                              legendPosition: LegendPosition.left,
                              legendTextStyle: TextStyle(fontSize: 20)),
                          degreeOptions: const  DegreeOptions(
                              totalDegrees: 280, initialAngle: 40),
                          chartValuesOptions: const ChartValuesOptions(
                              chartValueStyle: TextStyle(color: Colors.black)),
                          chartType: ChartType.ring,
                          animationDuration: const Duration(seconds: 2),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40),
                          child: Card(
                            child: Column(
                              children: [
                                ReuseableRow(
                                  title: "title",
                                  value: "value",
                                ),
                                ReuseableRow(
                                  title: "title",
                                  value: "value",
                                ),
                                ReuseableRow(
                                  title: "title",
                                  value: "value",
                                ),
                                ReuseableRow(
                                  title: "title",
                                  value: "value",
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: size.height * 0.07,
                          width: size.width * .8,
                          decoration: BoxDecoration(
                              borderRadius:
                              const BorderRadius.all(Radius.circular(25)),
                              color: Colors.white.withOpacity(.6)),
                          child: const Center(
                              child:  Text(
                                " Track Country's",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.black),
                              )),
                        )
                      ],
                    );


                  } else {
                    return const Center(child: Text("continue..."));

                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReuseableRow extends StatelessWidget {
  String title, value;
  ReuseableRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(right: 10, top: 20, bottom: 20, left: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text(value,
                  style: const TextStyle(
                    fontSize: 22,
                  )),
            ],
          ),
        ),
        const Divider(
          height: 1,
        )
      ],
    );
  }
}
