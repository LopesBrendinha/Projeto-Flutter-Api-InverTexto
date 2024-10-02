import 'dart:convert';

import 'package:http/http.dart' as http;

final String _token = "15477|FabPiVoU0xLybsQCilikb7A228MnnuhA";

Future<Map> converteNumeroPorExtenso(String? _valor) async{
  http.Response response;
  response = await http.get(Uri.parse("https://api.invertexto.com/v1/number-to-words?token=$_token&number=$_valor&language=pt&currency=BRL"));
  return json.decode(response.body);
}

Future<Map> buscarCEP(String? _valor) async{
  http.Response response;
  response = await http.get(Uri.parse("https://api.invertexto.com/v1/cep/$_valor?token=$_token"));
  return json.decode(response.body);
}

Future<Map> gerarPessoas(String? _locale) async{
  http.Response response;
  response = await http.get(Uri.parse("https://api.invertexto.com/v1/faker?token=$_token&fields=name%2C+cpf%2C+birth_date%2C+email%2C+phone_number&locale=$_locale"));
  return json.decode(response.body);
}


