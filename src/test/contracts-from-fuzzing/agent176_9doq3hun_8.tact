message(42) UniverseCalls {}

contract Test {
    // Using underscore to discard the receiver parameter
    receive(_: UniverseCalls) {
        // No operation needed
    }
}
