import 'package:flutter/material.dart';

class Producto_Papeleria extends StatelessWidget {
  final String nombre;
  final double precio_Venta;
  const Producto_Papeleria({Key key, this.nombre, this.precio_Venta})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        height: 60,
        color: Colors.blue[100],
        child: Row(
          children: [
            Icon(Icons.image),
            Text(
              this.nombre,
              style: TextStyle(fontSize: 25),
            ),
            Text(
              this.precio_Venta.toString(),
              style: TextStyle(fontSize: 25),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
      ),
    );
  }
}