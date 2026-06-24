message MyMessage {
    value: Int;
}

contract Test {
    // Receiver for a properly declared typed binary message
    receive(msg: MyMessage) {
        // Handling a typed binary message
    }
}
