import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'currencyModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BitCoin Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BitCoin Tracker'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Bpi> futureCurrencies;
  List<String> currencies = ['EUR', 'GBP', 'USD'];
  String selectedCurrencyRate = "";
  String selectedCurrencyType = "";
  late Bpi currTypes;
  late Usd? usd;
  late Eur? eur;
  late Gbp? gbp;

  Future<Bpi> fetchCurrencies() async {
    final response = await http
        .get(Uri.parse('https://api.coindesk.com/v1/bpi/currentprice.json'));

    if (response.statusCode == 200) {
      final currResponse = Bpi.fromJson(jsonDecode(response.body)['bpi']);
      usd = currResponse.usd;
      eur = currResponse.eur;
      gbp = currResponse.gbp;
      setState(() {
        selectedCurrencyRate = eur!.rate.toString();
      });
      return currResponse;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  void initState() {
    futureCurrencies = fetchCurrencies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(top: 50.0),
        color: Color.fromARGB(255, 56, 126, 131),
        child: Column(
          children: [
            Image.asset(
              "assets/images/bitcoin-logo.png",
              height: 150,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              double.parse(selectedCurrencyRate.replaceAll(',', ''))
                  .toStringAsFixed(2)
                  .toString(),
              style: TextStyle(color: Colors.amber, fontSize: 40),
            ),
            Spacer(),
            Expanded(
              child: CupertinoPicker(
                  itemExtent: 20,
                  offAxisFraction: 0,
                  magnification: 1.0,
                  diameterRatio: 1.0,
                  squeeze: 1.3,
                  scrollController: FixedExtentScrollController(
                    initialItem: currencies.indexOf(selectedCurrencyType),
                  ),
                  onSelectedItemChanged: (value) {
                    setState(() {
                      selectedCurrencyType = currencies[value];

                      switch (value) {
                        case 0:
                          selectedCurrencyRate = eur!.rate.toString();
                          break;
                        case 1:
                          selectedCurrencyRate = gbp!.rate.toString();
                          break;
                        case 2:
                          selectedCurrencyRate = usd!.rate.toString();
                          break;
                      }
                    });
                  },
                  children: currencies.asMap().entries.map((e) {
                    return Text(
                      e.value,
                      style: TextStyle(fontSize: 20),
                    );
                  }).toList()),
            )
          ],
        ),
      ),
    );
  }
}
