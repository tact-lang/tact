message UniverseCalls {}

contract Test {
    // Valid usage: wildcard in a receiver receives UniverseCalls message type
    receive(_: UniverseCalls) {
        // Discard the message payload
    }
}
