message MyMessage {
    value: Int;
}

contract TestMyMessage {
    // Receiver for typed binary message: MyMessage
    receive(msg: MyMessage) {
        // handling logic
    }
}
