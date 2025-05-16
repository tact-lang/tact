message(42) UniverseCalls {}

contract TestUnderscore {
    // Receiver function using underscore to discard parameter value
    receive(_: UniverseCalls) {
        // minimal implementation
    }
}
