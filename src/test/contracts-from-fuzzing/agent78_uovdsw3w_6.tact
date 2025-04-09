message(42) UniverseCalls {}

contract TestUnderscore {
    // Using underscore to discard the received message
    receive(_: UniverseCalls) {
        // no-op
    }
}
