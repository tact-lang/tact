message MyMessage {
    value: Int;
}

contract Test {
    // Receiver using underscore for discarding parameter
    receive(_: MyMessage) {
        // Just match the message
    }
}
