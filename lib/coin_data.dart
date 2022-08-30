import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = 'API-KEY-HERE';
const coinApi = 'https://rest.coinapi.io/v1/exchangerate';
// const coinPair = '/BTC/USD';

class CoinData {
  //3. Create the Asynchronous method getCoinData() that returns a Future (the price data).
  Future getBitcoinData(String fiat) async {
    //4. Create a url combining the coinAPIURL with the currencies we're interested, BTC to USD.
    String url = '$coinApi/BTC/$fiat?apikey=$apiKey';
    //5. Make a GET request to the URL and wait for the response.
    Uri url_ = Uri.parse(url);
    http.Response resp = await http.get(url_);

    if (resp.statusCode == 200) {
      //7. Use the 'dart:convert' package to decode the JSON data that comes back from coinapi.io.
      var decodedData = jsonDecode(resp.body);
      //8. Get the last price of bitcoin with the key 'last'.
      var lastPrice = decodedData['rate'];
      //9. Output the lastPrice from the method.
      return lastPrice;
    } else {
      //10. Handle any errors that occur during the request.
      print(resp.statusCode);
      //Optional: throw an error if our request fails.
      throw 'Problem with the get request';
    }
  }

  Future getEtherData(String fiat) async {
    //4. Create a url combining the coinAPIURL with the currencies we're interested, BTC to USD.
    String url = '$coinApi/ETH/$fiat?apikey=$apiKey';
    //5. Make a GET request to the URL and wait for the response.
    Uri url_ = Uri.parse(url);
    http.Response resp = await http.get(url_);

    if (resp.statusCode == 200) {
      //7. Use the 'dart:convert' package to decode the JSON data that comes back from coinapi.io.
      var decodedData = jsonDecode(resp.body);
      //8. Get the last price of bitcoin with the key 'last'.
      var lastPrice = decodedData['rate'];
      //9. Output the lastPrice from the method.
      return lastPrice;
    } else {
      //10. Handle any errors that occur during the request.
      print(resp.statusCode);
      //Optional: throw an error if our request fails.
      throw 'Problem with the get request';
    }
  }

  Future getLiteCoinData(String fiat) async {
    //4. Create a url combining the coinAPIURL with the currencies we're interested, BTC to USD.
    String url = '$coinApi/LTC/$fiat?apikey=$apiKey';
    //5. Make a GET request to the URL and wait for the response.
    Uri url_ = Uri.parse(url);
    http.Response resp = await http.get(url_);

    if (resp.statusCode == 200) {
      //7. Use the 'dart:convert' package to decode the JSON data that comes back from coinapi.io.
      var decodedData = jsonDecode(resp.body);
      //8. Get the last price of bitcoin with the key 'last'.
      var lastPrice = decodedData['rate'];
      //9. Output the lastPrice from the method.
      return lastPrice;
    } else {
      //10. Handle any errors that occur during the request.
      print(resp.statusCode);
      //Optional: throw an error if our request fails.
      throw 'Problem with the get request';
    }
  }
}

class CoinCard extends StatelessWidget {
  CoinCard({
    required this.currentPrice,
    required this.selectedCurrency,
    required this.crypto,
  });
  final String currentPrice;
  final String selectedCurrency;
  final String crypto;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.blueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $crypto = $currentPrice $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
