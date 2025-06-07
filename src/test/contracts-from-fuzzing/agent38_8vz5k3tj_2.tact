message UniverseCalls {}

contract TestDiscardReceiver {
    // Valid usage: underscore as a discard parameter in a receiver function
    receive(_: UniverseCalls) {
        // No operation
    }
}
