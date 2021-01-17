import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:proyecto_BD_Mobile/database/database.dart';
import 'package:proyecto_BD_Mobile/models/producto.dart';
import 'package:proyecto_BD_Mobile/widgets/producto_papeleria_widget.dart';
import 'package:proyecto_BD_Mobile/widgets/text_field_papeleria_widget.dart';

class AddSalePage extends StatefulWidget {
  const AddSalePage({Key key}) : super(key: key);

  @override
  _AddSalePageState createState() => _AddSalePageState();
}

class _AddSalePageState extends State<AddSalePage> {
  TextEditingController nombre_cliente;
  List<Producto> lista_Productos;

  @override
  void initState() {
    nombre_cliente = TextEditingController();
    lista_Productos = List();
    lista_Productos.add(Producto(
        codigo_barras: '6464146',
        precio_venta: 56,
        tipo_articulo: 'AS',
        nombre: 'Hojas de Papel'));
    lista_Productos.add(Producto(
        codigo_barras: '111111',
        precio_venta: 588,
        tipo_articulo: 'dsb',
        nombre: 'Cuaderno'));
    lista_Productos.add(Producto(
        codigo_barras: '222222',
        precio_venta: 1,
        tipo_articulo: 'ddd',
        nombre: 'tijeras'));
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    nombre_cliente.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva Venta'),
      ),
      body: CustomScrollView(
        //este es opcional solo para mover en algun momento las coordenadas del scroll
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(height: 20),
                Center(
                  child: Text(
                    'Datos del Clinete',
                    style: TextStyle(
                      color: Colors.blue[500],
                      fontSize: 25,
                    ),
                  ),
                ),
                TextFieldPapeleria(
                  controller: nombre_cliente,
                  label: 'Nombre Cliente',
                ),
                buildColumnProductos(),
                RaisedButton(
                  onPressed: () async {
                    print('Añadir Producto');
                  },
                  color: Colors.greenAccent[700],
                  child: Text('Añadir Producto'),
                ),
                RaisedButton(
                  onPressed: () async {
                    print('nueva venta');
                  },
                  color: Colors.blue,
                  child: Text('Realizar Venta'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Column buildColumnProductos() {
    List<Producto_Papeleria> list_Widgets = List();
    for (Producto prod in lista_Productos) {
      list_Widgets.add(Producto_Papeleria(
        nombre: prod.nombre,
        precio_Venta: prod.precio_venta,
      ));
    }
    return Column(
      children: list_Widgets,
    );
  }
}
