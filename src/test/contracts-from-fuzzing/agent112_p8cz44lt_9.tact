message MyMsg {
    a: Int;
}

contract Test {
    // Contract with all types of receivers to test prioritization

    // 1. Empty message receiver, highest priority for empty messages
    receive() {
        // Handles empty messages
    }

    // 2. Specific text message receiver for the comment "comment"
    receive("comment") {
        // Handles messages with specific text "comment"
    }

    // 3. Arbitrary text receiver for any other text messages
    receive(str: String) {
        // Handles all text messages that don't match a specific comment
    }

    // 4. Typed binary message receiver for MyMsg
    receive(msg: MyMsg) {
        let value = msg.a;
    }

    // 5. Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // Fallback for all other binary messages
    }
}
