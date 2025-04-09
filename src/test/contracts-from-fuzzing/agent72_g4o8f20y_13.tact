message MyMsg {
    a: Int;
}

contract TestAllReceivers {
    // 1. Receiver for empty messages
    receive() {
        // Empty message
    }

    // 2. Receiver for specific text messages
    receive("text") {
        // Specific text "text"
    }

    // 3. Receiver for arbitrary text messages
    receive(str: String) {
        // Just consume the string
        str;
    }

    // 4. Receiver for typed binary messages
    receive(msg: MyMsg) {
        // Access a field to trigger full compilation
        msg.a;
    }

    // 5. Fallback receiver for any unmatched binary messages
    receive(msg: Slice) {
        // Consume the message slice
        msg;
    }
}
