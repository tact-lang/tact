message MyMessage {
    value: Int;
}

contract MultiReceiver1 {
    // Fallback receiver: matches any binary message not matched earlier
    receive(msg: Slice) { }

    // Receiver for typed binary messages
    receive(msg: MyMessage) { }

    // Receiver for arbitrary text messages
    receive(str: String) { }

    // Receiver for specific text comment "specific"
    receive("specific") { }

    // Receiver for empty messages
    receive() { }
}
