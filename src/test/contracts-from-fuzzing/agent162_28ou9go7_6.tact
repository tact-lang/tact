message MyMessage {
    value: Int;
}

contract Test {
    // Typed binary message receiver
    receive(msg: MyMessage) {
        // Use the message field to ensure the receiver is compiled
        let x = msg.value;
    }

    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // Do nothing
    }
}
