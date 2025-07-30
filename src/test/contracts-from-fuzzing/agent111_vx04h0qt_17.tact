message MyMessage {
    value: Int;
}

contract Test {
    // Receiver for typed binary message with underscore discard parameter
    receive(_: MyMessage) {
        // Handling and discarding the message parameter
    }
}
