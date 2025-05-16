message MyMessage {
    value: Int;
}

contract Test {
    // Testing typed binary message reception with a custom message type
    receive(msg: MyMessage) {
        // Handler for MyMessage type messages
    }
}
