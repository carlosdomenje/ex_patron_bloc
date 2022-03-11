part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUserEvent extends UserEvent {
  final Usuario user;

  ActivateUserEvent(this.user) {}
}

class UserChangeAgeEvent extends UserEvent {
  final int age;

  UserChangeAgeEvent(this.age);
}

class UserAddProfesionEvent extends UserEvent {
  final String prof;

  UserAddProfesionEvent(this.prof);
}

class UserDeleteEvent extends UserEvent {}
