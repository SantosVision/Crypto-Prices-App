import 'package:flutter/material.dart';
import 'package:bitcoin_ticker/coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  CoinData coinData = CoinData();
  String selectedCurrency = 'USD';

  DropdownButton getDropdownItems() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownItems.add(newItem);
    }
    return DropdownButton<dynamic>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getCurrentPrice();
          getEthPrice();
          getLitePrice();
        });
      },
    );
  }

  String currentPrice = '?';
  String currentEthPrice = '?';
  String currentLtcPrice = '?';

  void getCurrentPrice() async {
    double coinPrice = await coinData.getBitcoinData(selectedCurrency);
    setState(() {
      currentPrice = coinPrice.toStringAsFixed(2);
    });
  }

  void getEthPrice() async {
    double coinPrice = await coinData.getEtherData(selectedCurrency);
    setState(() {
      currentEthPrice = coinPrice.toStringAsFixed(2);
    });
  }

  void getLitePrice() async {
    double coinPrice = await coinData.getLiteCoinData(selectedCurrency);
    setState(() {
      currentLtcPrice = coinPrice.toStringAsFixed(2);
    });
  }

  @override
  void initState() {
    super.initState();
    getCurrentPrice();
    getEthPrice();
    getLitePrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            children: [
              CoinCard(
                currentPrice: currentPrice,
                selectedCurrency: selectedCurrency,
                crypto: 'BTC',
              ),
              CoinCard(
                currentPrice: currentEthPrice,
                selectedCurrency: selectedCurrency,
                crypto: 'ETH',
              ),
              CoinCard(
                currentPrice: currentLtcPrice,
                selectedCurrency: selectedCurrency,
                crypto: 'LTC',
              ),
            ],
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getDropdownItems(),
          ),
        ],
      ),
    );
  }
}
