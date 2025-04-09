message MyMessage {
    val: Int;
}

contract Test {
    // All receiver types declared as per documentation

    // 1. Empty message receiver
    receive() {
        // Handle empty messages
    }

    // 2. Literal text receiver
    receive("hello") {
        // Handle messages that exactly match 'hello'
    }

    // 3. Arbitrary text receiver
    receive(s: String) {
        // Handle any text message
    }

    // 4. Receiver for typed binary messages
    receive(msg: MyMessage) {
        // Handle messages conforming to MyMessage
    }

    // 5. Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // Fallback receiver
    }
}
