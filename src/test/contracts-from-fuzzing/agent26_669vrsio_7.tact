message UniverseCalls {
    n: Int;
}

contract TestDiscardReceiver {
    // Test receiver function using underscore to discard parameter
    receive(_: UniverseCalls) {
        // Parameter is intentionally discarded
    }
}
