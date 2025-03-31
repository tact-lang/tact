message UniverseCalls {}

contract UnderscoreTypedReceiver {
    // Using underscore to discard the receiver parameter for a typed message
    receive(_: UniverseCalls) {
        // No use of the parameter
    }
}
