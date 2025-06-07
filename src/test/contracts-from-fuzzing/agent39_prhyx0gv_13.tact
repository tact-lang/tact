message MyMessage {
    v: Int;
}

contract Test {
    // Test: Receiver for a binary message of type MyMessage using underscore to discard the parameter
    receive(_ : MyMessage) {
        // The parameter is discarded
    }
}
