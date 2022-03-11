class Usuario {
  final String nombre;
  final int edad;
  final List<String> profesiones;

  Usuario(
      {required this.nombre, required this.edad, required this.profesiones});

  /* Creo una copia de la clase usuario para poder modificar parametros de ella
  y obtener una nueva instancia con los parametros modificados. 
  Si alguno de los parametros no esta presente, devuelve el de la clase principal*/
  Usuario copyWith({String? nombre, int? edad, List<String>? profesiones}) =>
      Usuario(
          nombre: nombre ?? this.nombre,
          edad: edad ?? this.edad,
          profesiones: profesiones ?? this.profesiones);
}
