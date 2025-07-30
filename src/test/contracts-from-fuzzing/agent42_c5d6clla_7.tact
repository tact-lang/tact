message(42) UniverseCalls {}

contract Test {
    // Receiver using underscore to discard the parameter
    receive(_: UniverseCalls) {
        // No operation
    }
}
