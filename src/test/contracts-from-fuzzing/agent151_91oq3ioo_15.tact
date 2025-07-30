message MyMessage {
    value: Int;
}

contract TestReceiverOrder {
    // Receiver for fallback binary messages
    receive(msg: Slice) {}

    // Receiver for specific literal text message "special"
    receive("special") {}

    // Receiver for arbitrary text messages
    receive(str: String) {}

    // Receiver for typed binary messages
    receive(msg: MyMessage) {}

    // Receiver for empty messages
    receive() {}
}
