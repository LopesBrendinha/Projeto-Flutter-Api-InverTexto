import 'package:flutter/material.dart';
import 'package:inveter_texto/service/invertexto_service.dart';
import 'package:inveter_texto/view/busca_cep_page.dart';
import 'package:inveter_texto/view/gera_pessoas_page.dart';
import 'package:inveter_texto/view/por_extenso_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/imgs/invertextoLogo.png',
              fit: BoxFit.contain,
              height: 40,
            ),
          ],
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(children:<Widget>[
          GestureDetector(
            child: Row(
              children: <Widget>[
                Icon(Icons.edit, color: Color.fromARGB(255, 90, 159, 248), size: 70.0),
                Text("Por Extenso", style: TextStyle(
                  color: Colors.black, fontSize: 22.0
                ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: ((context) => 
               PorExtensoPage())));
            },
          ),
          GestureDetector(
            child: Row(
              children: <Widget>[
                Icon(Icons.home, color: Color.fromARGB(255, 90, 159, 248), size: 70.0),
                Text("Buscar CEP", style: TextStyle(
                  color: Colors.black, fontSize: 22.0
                ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: ((context) => 
               BuscaCepPage())));
            },
          ),
          GestureDetector(
            child: Row(
              children: <Widget>[
                Icon(Icons.manage_accounts, color: Color.fromARGB(255, 90, 159, 248), size: 70.0),
                Text("Gerar Pessoa", style: TextStyle(
                  color: Colors.black, fontSize: 22.0
                ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: ((context) => 
               geraPessoasPage())));
            },
          ),
        ]),
      ),
    );
  }
}