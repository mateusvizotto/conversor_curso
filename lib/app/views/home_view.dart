import 'package:conversor_curso/app/componentes/currency_box.dart';
import 'package:conversor_curso/app/controlers/home_controller.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController toText = TextEditingController();

  final TextEditingController fromText = TextEditingController();

  HomeController homeController;

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
          padding: EdgeInsets.only(
            top: 100,
            left: 30,
            right: 30,
            bottom: 20,
          ),
          child: Column(
            children: <Widget>[
              Image.asset(
                'assets/logo.jpg',
                width: 150,
                height: 150,
              ),
              SizedBox(
                height: 30,
              ),
              CurrencyBox(
                selectedItem: homeController.toCurrency,
                controller: toText,
                items: homeController.currencies,
                onChanged: (model) {
                  setState(() {
                    homeController.toCurrency = model;
                  });
                },
              ),
              SizedBox(
                height: 10,
              ),
              CurrencyBox(
                selectedItem: homeController.fromCurrency,
                controller: fromText,
                items: homeController.currencies,
                onChanged: (model) {
                  setState(() {
                    homeController.fromCurrency = model;
                  });
                },
              ),
              SizedBox(
                height: 50,
              ),
              RaisedButton(
                color: Colors.amber,
                onPressed: () {
                  homeController.convert();
                },
                child: Text('CONVERTER'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
