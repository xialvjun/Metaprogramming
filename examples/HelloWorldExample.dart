import '../OZClass.dart' show OZClass;

/**
 * Shows a simple example of the use of the OZClass.
 */
void main () {
  // Creates the example
  OZClass example = new OZClass();
  
  // Adding properties
  example.property( 'property1', 'Hello' );
  example.property( 'property2', 'World!' );
  
  // Adding methods
  example.addMethod( 'sayHelloWorld', ( OZClass self,[ List<dynamic> params ] ) {
    print( "${self.property( 'property1' )} ${self.property( 'property2' )}" );
  });
  
  // Calling the method
  example.callMethod( 'sayHelloWorld' );  // 'Hello World!'
}