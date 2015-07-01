/**
 * A function that must accept an Object of OZClass. The function is
 * used to create methods of the OZClass.
 */
typedef dynamic method ( OZClass self, [ List<dynamic> params ] );

/**
 * Empty class that can be filled with methods and properties dynamically.
 */
class OZClass {
  /**
   * Map of the properties of the class.
   */
  Map<String, dynamic> properties;
  
  /**
   * Map with the methods of the class.
   */
  Map<String, method> methods; 
  
  /**
   * Creates the empty class without methods and properties.
   */
  OZClass() {
    properties = new Map<String, dynamic>();
    methods = new Map<String, method>();
  }
  
  /**
   * Creates or sets the value of the property if a value is indicated. Anyway
   * the value of the property is returned, or null if there is no property
   * with that name.
   * Throws Exception if an empty name is used (name = '').
   */
  dynamic property ( String name, [ dynamic value = null ] ) {
    if ( name == '' || name == null ) {
      throw new Exception( 'Property without name' );
    }
    if ( value != null ) {
      properties[ name ] = value;
    }
    return properties.containsKey( name ) ? properties[ name ] : null;
  }
  
  /**
   * Creates a new method.
   */
  void addMethod ( String name, method method ) {
    if ( name == null || name == '' ) {
      throw new Exception( 'Method without name' );
    }
    if ( method == null ) {
      throw new Exception( 'Can\'t create a null method' );
    }
    methods[ name ] = method;
  }
  
  /**
   * Calls the method with the params if the a method with the name
   * indicated exists. Returns the result of calling the method, or
   * null.
   */
  dynamic callMethod ( String name, [ List<dynamic> params = null ] ) {
    dynamic value = null;
    if ( methods.containsKey( name ) ) {
      value = methods[ name ]( this, params );
    }
    return value;
  }
  
  /**
   * Returns true if a property with that name exists.
   */
  bool propertyExists ( String name ) {
    return properties.containsKey( name );
  }
  
  /**
   * Returns true if a method with that name exists.
   */
  bool methodExists ( String name ) {
    return methods.containsKey( name );
  }
  
  /**
   * Deletes the property with the name indicated. Returns a bool value
   * that indicates if the property was removed.
   */
  bool removeProperty ( String name ) {
    return properties.remove( name ) != null ? true : false;
  }
  
  /**
   * Deletes the method with the name indicated. Returns a bool value
   * that indicates if the method was removed.
   */
  bool removeMethod ( String name ) {
    return methods.remove( name ) != null ? true : false;
  }
  
  /**
   * Returns the name of the properties.
   */
  List<String> get namesOfProperties {
    return properties.keys.toList();
  }
  
  /**
   * Returns the name of the methods.
   */
  List<String> get namesOfMethods {
    return methods.keys.toList();
  }
  
  /**
   * Returns the number of properties.
   */
  int get numberOfProperties {
    return properties.length;
  }
  
  /**
   * Returns the number of methods.
   */
  int get numberOfMethods {
    return methods.length;
  }
}
