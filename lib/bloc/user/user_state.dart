part of 'user_bloc.dart';

@immutable
abstract class UserState {
  final bool existeUsuario;
  final Usuario? user;

  const UserState({this.existeUsuario = false, this.user});
}

/* Estado inicial */
class UserInitialState extends UserState {
  const UserInitialState() : super(existeUsuario: false, user: null);
}

/* Cambio de estado de usuario a true */

class UserValidateState extends UserState {
  final Usuario newUser;

  const UserValidateState(this.newUser)
      : super(existeUsuario: true, user: newUser);
}
