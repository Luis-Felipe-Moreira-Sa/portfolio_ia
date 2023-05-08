import 'package:flutter/material.dart';
import 'package:portfolio/investment.dart';

void main() {
  runApp(MaterialApp(
    title: "InvestmentPortfolio",
    theme: ThemeData.dark().copyWith(
      // Cor dos ícones
      iconTheme: IconThemeData(
        color: Colors.white, // Cor branca para os ícones
      ),

      // Cor dos textos
      textTheme: TextTheme(
        bodyLarge: TextStyle(
          color: Colors.white, // Cor branca para textos principais
        ),
        bodyMedium: TextStyle(
          color: Colors.grey, // Cor cinza claro para textos secundários
        ),
      ),

      // Cor de fundo do Scaffold
      scaffoldBackgroundColor: Colors.black, // Cor preta para o fundo
    ),
    home: InvestmentPortfolio(),
    debugShowCheckedModeBanner: false,
  ));
}
