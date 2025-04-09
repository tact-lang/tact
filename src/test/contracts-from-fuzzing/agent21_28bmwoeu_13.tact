message Msg {
    a: Int;
}

contract Test {
    // 1. Empty message receiver
    receive() {
        // Handle empty messages
    }

    // 2. Specific text comment receiver
    receive("comment") {
        // Handle messages with specific comment "comment"
    }

    // 3. Arbitrary text message receiver
    receive(str: String) {
        // Handle arbitrary text messages
    }

    // 4. Typed binary message receiver
    receive(msg: Msg) {
        // Handle typed binary messages
    }

    // 5. Fallback binary receiver using Slice
    receive(msg: Slice) {
        // Handle all unmatched binary messages
    }
}
