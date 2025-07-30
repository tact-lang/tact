message MyMessage {
    a: Int;
}

contract TestReceiverTyped {
    receive(msg: MyMessage) {
        // receiver for typed binary messages
    }
}
