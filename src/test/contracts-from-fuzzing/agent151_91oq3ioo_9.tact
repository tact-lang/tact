message MyMessage {
    value: Int;
}

contract TestReceiverTyped {
    // Receiver that accepts typed binary message as MyMessage
    receive(msg: MyMessage) {
        // Handler for typed binary message
    }
}
