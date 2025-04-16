message MyMessage {
    value: Int;
}

contract Test {
    // Receiver using underscore parameter to discard the received message
    receive(_: MyMessage) {
        // No need to inspect message
    }
}
