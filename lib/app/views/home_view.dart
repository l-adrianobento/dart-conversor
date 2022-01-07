import 'package:conversor_curso/app/components/currency_box.dart';
import 'package:conversor_curso/app/controllers/home_controller.dart';
import 'package:conversor_curso/app/models/currency_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();

  late HomeController homeController;
  @override
  void initState() {
    super.initState();
    homeController = HomeController(toText: toText, fromText: fromText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 30, right: 30),
          child: Column(
            children: [
              Image.asset(
                'assets/logo.png',
                width: 150,
                height: 150,
              ),
              SizedBox(height: 50),
              CurrencyBox(
                  selectedItem: homeController.toCurrency,
                  items: homeController.currencies,
                  controller: toText,
                  onChanged: (model) {
                    setState(() {
                      if (model != null) {
                      homeController.toCurrency = model;
                      }
                    });
                  }),
              SizedBox(height: 10),
              CurrencyBox(
                  selectedItem: homeController.fromCurrenty,
                  items: homeController.currencies,
                  controller: fromText,
                  onChanged: (model) {
                    setState(() {
                      if (model != null) {
                        homeController.fromCurrenty = model;
                      }
                    });
                  }),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  homeController.convert();
                },
                child: Text('CONVERTER'),
                style: ElevatedButton.styleFrom(primary: Colors.amber),
              )
            ],
          ),
        ),
      ),
    );
  }
}
