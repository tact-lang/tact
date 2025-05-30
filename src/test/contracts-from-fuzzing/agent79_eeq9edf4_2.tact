message UniverseCalls {}

contract TestReceiver {
    // Valid usage: wildcard discard parameter in a receiver, as per docs 
    receive(_: UniverseCalls) {
        // No operation
    }
}
