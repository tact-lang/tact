message(42) UniverseCalls {}

contract Test {
    // Receiver with underscore to discard parameter
    receive(_: UniverseCalls) {
        // No-op handler
    }
}
