message(42) UniverseCalls {}

contract TestUnderscore {
    // Test: Using underscore to discard receiver parameter
    receive(_: UniverseCalls) {
        // Minimal valid implementation when message is received
    }
}
