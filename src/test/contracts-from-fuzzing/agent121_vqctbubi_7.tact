message(42) UniverseCalls {}

contract TestUnderscore {
    // Receiver using underscore to discard the parameter
    receive(_: UniverseCalls) {
        // no-op, parameter is intentionally discarded
    }
}
