message MyMessage {
    a: Int;
}

contract TestUnderscore {
    // Receiver using underscore to discard the message parameter of type MyMessage
    receive(_: MyMessage) {
        // Parameter is discarded
    }

    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // Fallback handling
    }
}
