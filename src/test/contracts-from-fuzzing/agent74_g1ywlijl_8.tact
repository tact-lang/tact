/// Test: Receiver function using underscore for discarding parameter
message(42) UniverseCalls {}

contract TestUnderscore {
    // Receiver that discards the UniverseCalls message
    receive(_: UniverseCalls) {
        // No action needed
    }
}
