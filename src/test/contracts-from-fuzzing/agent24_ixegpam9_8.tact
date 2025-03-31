message UniverseCalls {
    dummy: Int = 0;
}

contract Test {
    // Using underscore to indicate unused parameter
    receive(_: UniverseCalls) {
        // No operation needed
    }
}
