message UniverseCalls {
    dummy: Int;
}

contract Example {
    // Receiver using underscore parameter, discards the message instance
    receive(_: UniverseCalls) {
    }
}
