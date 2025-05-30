message UniverseCalls {
}

contract TestUnderscore {
    // Receiver using underscore parameter to discard the message
    receive(_: UniverseCalls) {
        // No operation; underscore parameter indicates unused value
    }
}
