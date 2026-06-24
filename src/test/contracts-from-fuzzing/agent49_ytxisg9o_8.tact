message UniverseCalls { }

contract Test {
    // Receiver function using underscore parameter discard syntax
    receive(_: UniverseCalls) {
        // Parameter is discarded, so no reference to received message
    }
}
