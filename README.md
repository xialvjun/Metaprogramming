# Metaprogramming
<h2>Metaprogramming in Dart</h2>
<p>
The OZClass lets you create objects that are able to dynamically add methods and properties. This feature is useful
in some cases; for instance:
</p>
<ul>
  <li>Objects that <strong>learn</strong> methods</li>
  <li>Objects that delete their properties</li>
  <li>Objects that create properties</li>
</ul>
<p>
In the <strong>examples</strong> folder there are some examples that show you how to use the class. Anyway,
your imagination is the limit, Have fun!
</p>
<h2>Examples</h2>
<h3>Hello World! Example</h3>
<pre>
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
</pre>
<h3>Custom Class Builder</h3>
<h4>The Function</h4>
<pre>
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
</pre>
<h4>Main</h4>
<pre>
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
</pre>
<h3>Inheritance</h3>
<h4>Class</h4>
<pre>
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
</pre>
<h4>Main</h4>
<pre>
void main () {
  Person me = new Person( 'Adri', 200 );
  
  // What's your name?
  me.callMethod( 'printName' ); // Adri
  
  // How old are you?
  me.callMethod( 'printAge' ); // 200
  
  // Can you swim?
  // No I don't, but I can learn
  me.addMethod( 'swim', ( OZClass self, [ List<dynamic> params ] ) {
    print( 'Yeah, now I can swim' );
  });
  me.callMethod( 'swim' ); // Yeah, now I can swim
}
</pre>
