message MyMessage {
    value: Int;
}

contract Test {
    // Receiver for a valid typed binary message using a proper message type
    receive(msg: MyMessage) {
        // Process MyMessage type
    }
}
