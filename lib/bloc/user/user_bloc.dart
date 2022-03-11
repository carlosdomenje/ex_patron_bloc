import 'package:bloc/bloc.dart';
import 'package:bloc_practice/models/usuario_model.dart';
import 'package:meta/meta.dart';

part 'user_state.dart';
part 'user_event.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUserEvent>((event, emit) {
      /* Emito un nuevo estado, en este caso un nuevo usuario activado */
      emit(UserValidateState(event.user));
    });

    /* Para borrar el usuario, emito un estado inicial, que reinicia los valores
    actuales a los originales. */
    on<UserDeleteEvent>((event, emit) {
      /* Emito un nuevo estado, en este caso un nuevo usuario activado */
      emit(const UserInitialState());
    });

    on<UserChangeAgeEvent>((event, emit) {
      // Tengo acceso al state por estar extendido del USerState
      if (!state.existeUsuario) return;
      // Emito un nuevo estado del usuario pero solo con la edad cambiada, ya que
      // al no pasarle otro parametro al copywith sigo con el original del estado anterior
      emit(UserValidateState(state.user!.copyWith(edad: event.age)));
    });

    on<UserAddProfesionEvent>((event, emit) {
      // Tengo acceso al state por estar extendido del USerState
      if (!state.existeUsuario) return;
      // Emito un nuevo estado del usuario pero solo con la edad cambiada, ya que
      // al no pasarle otro parametro al copywith sigo con el original del estado anterior

      //Agrego la profesion que viene en el evento
      final profesionesTotales = [...state.user!.profesiones, event.prof];

      emit(UserValidateState(
          state.user!.copyWith(profesiones: profesionesTotales)));
    });
  }
}
