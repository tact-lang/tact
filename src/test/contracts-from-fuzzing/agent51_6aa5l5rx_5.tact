message(42) UniverseCalls {}

contract Test {
    // Receiver using underscore to discard the UniverseCalls message
    receive(_: UniverseCalls) {
        // Processing the message, but discarding its content
    }
}
