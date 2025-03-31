message MyMessage {
    x: Int;
}

contract TestReceiverTyped {
    // This contract handles typed binary messages using a message type
    receive(msg: MyMessage) {
        // process typed binary message
    }
}
