message(42) UniverseCalls {}

contract Example {
    receive(_: UniverseCalls) {
        // accepted usage of wildcard parameter for discarding message
    }
}
