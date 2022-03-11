import 'package:bloc_practice/bloc/user/user_bloc.dart';
import 'package:bloc_practice/models/usuario_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserBloc>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagina 2'),
        actions: [
          IconButton(
              onPressed: () {
                BlocProvider.of<UserBloc>(context).add(UserDeleteEvent());
              },
              icon: Icon(Icons.delete))
        ],
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MaterialButton(
              child: Text('Establecer Usuario',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                Usuario newUser = Usuario(
                    nombre: 'Carlos', edad: 35, profesiones: ['Fullstack']);

                //BlocProvider.of<UserBloc>(context, listen: false)
                userBloc.add(ActivateUserEvent(newUser));
              }),
          MaterialButton(
              child:
                  Text('Cambiar Edad', style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userBloc.add(UserChangeAgeEvent(30));
              }),
          MaterialButton(
              child: Text('Añadir Profesion',
                  style: TextStyle(color: Colors.white)),
              color: Colors.blue,
              onPressed: () {
                userBloc.add(UserAddProfesionEvent('Nueva Profesion'));
              }),
        ],
      )),
    );
  }
}
