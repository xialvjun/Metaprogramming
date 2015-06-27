import '../OZClass.dart' show OZClass;

/**
 * Returns an instance of the OZClass with the properties and methods
 * of a person.
 */
OZClass personBuilder ( String name, int age ) {
  OZClass tmp = new OZClass();
  
  // Adding properties
  tmp.property( 'name', name );
  tmp.property( 'age', age );
  
  // Adding a method
  tmp.addMethod( 'greeting', ( OZClass self, [ List<dynamic> params ] ) {
    print( "\nHi, my name is ${self.property( 'name' )}" );
    print( "I\'m ${self.property( 'age' )} years old" );
  });
  
  return tmp;
}

/**
 * Creates a List of persons and show the messages.
 */
void main () {
  List<OZClass> persons = [
    personBuilder( 'Jimmy', 30 ),
    personBuilder( 'Mike', 24 ),
    personBuilder( 'Jane', 45 )
  ];
  
  // Show the greetings
  persons.forEach(( OZClass person ) {
    person.callMethod( 'greeting' );
  });
  /*
   * Result:
   * Hi, my name is Jimmy
   * I'm 30 years old
   *
   * Hi, my name is Mike
   * I'm 24 years old
   *
   * Hi, my name is Jane
   * I'm 45 years old
   */
}