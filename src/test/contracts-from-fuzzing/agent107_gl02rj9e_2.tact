message UniverseCalls {}

contract Example {
    // Valid use of wildcard in a receiver parameter with a message type
    receive(_: UniverseCalls) {
        // Discarded parameter, no access to its value
    }
}
