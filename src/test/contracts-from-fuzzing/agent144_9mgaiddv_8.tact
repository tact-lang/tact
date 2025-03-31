message UniverseCalls {}

contract UnderscoreReceiver {
    // Receiver using underscore to discard the message parameter
    receive(_: UniverseCalls) {
        // No operation, testing underscore parameter
    }
}
