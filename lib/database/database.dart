import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:proyecto_BD_Mobile/models/domicilio_cliente.dart';

class DB {
  static int current_id_cliente;

  static Future<Domiclio_Cliente> nuevoCliente(
    String nombre,
    String ap_pat,
    String ap_mat,
    String rz_social,
    String email,
    String estado,
    String colonia,
    String calle,
    String numero,
    String cp,
  ) async {
    Future.delayed(Duration(seconds: 1));
    var url = 'http://10.0.2.2:3000/cliente/domicilio';
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
        <String, String>{
          'nombre': nombre,
          'ap_pat': ap_pat,
          'ap_mat': ap_mat,
          'rz_social': rz_social,
          'email': email,
          'estado': estado,
          'colonia': colonia,
          'calle': calle,
          'numero': numero,
          'cp': cp,
        },
      ),
    );
    var resJson = json.decode(response.body);
    var dom_clt = Domiclio_Cliente(
      id_cliente: resJson['id_cliente'],
      id_domicilio: resJson['id_domicilio'],
      id_domiclio_cliente: resJson['id_domiclio_cliente'],
    );
    DB.current_id_cliente = dom_clt.id_cliente;
    return dom_clt;
  }
}
