import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:portfolio/pages/home.dart';
import 'package:portfolio/pages/portfolio.dart';
import 'package:portfolio/pages/prevision.dart';
import 'package:portfolio/pages/sectorportfolio.dart';

class InvestmentPortfolio extends StatefulWidget {
  const InvestmentPortfolio({super.key});

  @override
  State<InvestmentPortfolio> createState() => _InvestmentPortfolioState();
}

class _InvestmentPortfolioState extends State<InvestmentPortfolio> {
  List<Map<String, dynamic>> stockData = [
    {
      "name": "Apple Inc.",
      "ticker": "AAPL",
      "price": "\$149.06",
      "price_future": "\$155.25",
      "sector": "Technology",
      "percentage": 0.52,
      "backgroundColor": Colors.grey[800],
    },
    {
      "name": "Tesla Inc.",
      "ticker": "TSLA",
      "price": "\$725.32",
      "price_future": "\$700.15",
      "sector": "Automotive",
      "percentage": -1.24,
      "backgroundColor": Colors.black87,
    },
    {
      "name": "Amazon.com Inc.",
      "ticker": "AMZN",
      "price": "\$3,143.87",
      "price_future": "\$3,200.50",
      "sector": "Retail",
      "percentage": 2.81,
      "backgroundColor": Colors.green[600],
    },
  ];

  String calculatePercentage(Map<String, dynamic> data) {
    double price = data['price'];
    double priceFuture = data['price_future'];
    double percentage = ((price - priceFuture) / price) * 100;
    return '${percentage.toStringAsFixed(2)}%';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Investment Portfolio"),
        backgroundColor:
            Colors.blueGrey[800], // use a navy blue background color
      ),
      body: ListView.builder(
        itemCount: stockData.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> stock = stockData[index];

          return _buildStockItem(
            stock["name"],
            stock["ticker"],
            stock["price"],
            stock["price_future"],
            stock["sector"],
            stock["percentage"],
            Colors.lightGreen[900]!,
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.account_balance_wallet),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PortfolioPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.trending_up),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrevisaoPage()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.category_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CarteiraSetoresPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStockItem(
    String name,
    String ticket,
    String price,
    String price_future,
    String sector,
    double percentage,
    Color backgroundColor,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // use an icon or image to represent the stock sector
              Icon(Icons.business_center),
              SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "$ticket - $price - $price_future",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    sector,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(Icons.bar_chart, color: Colors.white),
              SizedBox(height: 4),
              Text(
                "${percentage.toStringAsFixed(2)}%",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
