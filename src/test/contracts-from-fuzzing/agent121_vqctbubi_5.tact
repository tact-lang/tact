message MyMsg {
    a: Int;
}

contract TestTypedMessage {
    // Receiver for typed binary messages using a defined message type
    receive(msg: MyMsg) {
        // no-op
    }
}
