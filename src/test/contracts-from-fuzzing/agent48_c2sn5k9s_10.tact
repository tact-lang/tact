message MyMsg {
    val: Int;
}

contract MultiReceiver {
    // 1. Empty message receiver
    receive() {
        // Handles empty messages
    }

    // 2. Specific text receiver for "foo"
    receive("foo") {
        // Handles messages with exact text "foo"
    }

    // 3. Arbitrary text receiver
    receive(str: String) {
        // Handles any text message
    }

    // 4. Typed binary message receiver
    receive(msg: MyMsg) {
        // Handles messages of type MyMsg
    }

    // 5. Fallback receiver for binary messages not matched above
    receive(msg: Slice) {
        // Handles any unmatched binary message
    }
}
