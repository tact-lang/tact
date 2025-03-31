message SomeMessage {}

contract TestUnderscore {
    // Testing receiver with underscore to discard the parameter
    receive(_: SomeMessage) {
        // The message is received and discarded
    }
}
