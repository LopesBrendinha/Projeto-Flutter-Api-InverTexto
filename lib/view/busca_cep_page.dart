import 'package:flutter/material.dart';
import 'package:inveter_texto/service/invertexto_service.dart';

class BuscaCepPage extends StatefulWidget {
  const BuscaCepPage({super.key});

  @override
  State<BuscaCepPage> createState() => _BuscaCepPageState();
}

class _BuscaCepPageState extends State<BuscaCepPage> {
  String? campo;
  String? resultado;

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
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Digite o seu CEP",
                labelStyle: TextStyle(color: Color.fromARGB(255, 90, 159, 248),),
                border: OutlineInputBorder(),
              ),
            
              keyboardType: TextInputType.number,
              style: TextStyle(color: Color.fromARGB(255, 90, 159, 248), fontSize: 18),
                onSubmitted: ((value) {
                  setState(() {
                    campo = value;
                  });
                }
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: buscarCEP(campo),
                builder: ((context, snapshot) {
                    switch(snapshot.connectionState){
                      case ConnectionState.waiting:
                      case ConnectionState.none:
                        return Container(
                          width: 200.0,
                          height: 200.0,
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Color.fromARGB(255, 90, 159, 248)),
                            strokeWidth: 5.0,
                          ),
                        );
                      default:
                        if(snapshot.hasError)
                          return Container();
                        else 
                          return exibeResultado(context, snapshot);
                    }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget exibeResultado(BuildContext context, AsyncSnapshot snapshot){
    return Padding(padding: EdgeInsets.only(top: 10.0),
      child: Column(
        children:<Widget> [
          SizedBox(height: 10),
          TextField(
            readOnly: true,
            decoration: InputDecoration(
              labelText: snapshot.data["cep"],
              labelStyle: TextStyle(color: Color.fromARGB(255, 90, 159, 248)),
              border: OutlineInputBorder(),
            ),
            style: TextStyle(color: Color.fromARGB(255, 90, 159, 248), fontSize: 18),
          ),
          SizedBox(height: 10),
          TextField(
            readOnly: true,
            decoration: InputDecoration(
              labelText: snapshot.data["state"],
              labelStyle: TextStyle(color: Color.fromARGB(255, 90, 159, 248)),
              border: OutlineInputBorder(),
            ),
            style: TextStyle(color: Color.fromARGB(255, 90, 159, 248), fontSize: 18),
          ),
          SizedBox(height: 10),
          TextField(
            readOnly: true,
            decoration: InputDecoration(
              labelText: snapshot.data["city"],
              labelStyle: TextStyle(color: Color.fromARGB(255, 90, 159, 248)),
              border: OutlineInputBorder(),
            ),
            style: TextStyle(color: Color.fromARGB(255, 90, 159, 248), fontSize: 18),
          ),
          SizedBox(height: 10),
          TextField(
            readOnly: true,
            decoration: InputDecoration(
              labelText: snapshot.data["neighborhood"],
              labelStyle: TextStyle(color: Color.fromARGB(255, 90, 159, 248)),
              border: OutlineInputBorder(),
            ),
            style: TextStyle(color: Color.fromARGB(255, 90, 159, 248), fontSize: 18),
          ),
          SizedBox(height: 10),
          TextField(
            readOnly: true,
            decoration: InputDecoration(
              labelText: snapshot.data["street"],
              labelStyle: TextStyle(color: Color.fromARGB(255, 90, 159, 248)),
              border: OutlineInputBorder(),
            ),
            style: TextStyle(color: Color.fromARGB(255, 90, 159, 248), fontSize: 18),
          ),

        ],
      ),
    );
  }
}