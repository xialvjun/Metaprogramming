import '../OZClass.dart' show OZClass;

/**
 * A custom class that is built with the OZClass.
 */
class Person extends OZClass {
  /**
   * Creates a person with a name and an age.
   */
  Person( String name, int age ) : super() {
    // Errors
    if ( name == null || name == '' ) {
      throw new Exception( 'Empty name' );
    }
    if ( age == null || age < 0 ) {
      throw new Exception( 'Not valid age' );
    }
    // Properties
    property( 'name', name );
    property( 'age', age );
    
    // Adding methods
    /*
     * Prints the name of the person.
     */
    addMethod( 'printName', ( OZClass self, [ List<dynamic> params ] ) {
      print( self.property( 'name' ) );
    });
    
    /*
     * Prints the age of the person.
     */
    addMethod( 'printAge', ( OZClass self, [ List<dynamic> params ] ) {
      print( self.property( 'age' ) );
    });
  }
  
  // Shorcuts
  String get name {
    return property( 'name' );
  }
  
  int get age {
    return property( 'name' );
  }
}

void main () {
  Person me = new Person( 'Adri', 200 );
  
  // What's your name?
  me.callMethod( 'printName' ); // Adri
  
  // How old are you?
  me.callMethod( 'printAge' ); // 200
  
  // Can you swim?
  me.addMethod( 'swim', ( OZClass self, [ List<dynamic> params ] ) {
    print( 'Yeah, now I can swim' );
  });
  me.callMethod( 'swim' ); // Yeah, now I can swim
}