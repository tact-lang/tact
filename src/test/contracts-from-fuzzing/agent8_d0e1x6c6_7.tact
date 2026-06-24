message(42) UniverseCalls {}

contract Test {
    // Receiver with underscore parameter to discard message content
    receive(_: UniverseCalls) {
        // This receiver should match messages of type UniverseCalls
    }
}
