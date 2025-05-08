message MyMessage {
    value: Int;
}

contract Test {
    // Receiver for typed binary messages
    receive(msg: MyMessage) {
        // Handle typed binary messages
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        // Handle arbitrary text messages
    }

    // Receiver for specific text comment "hello"
    receive("hello") {
        // Handle specific "hello" comment messages
    }

    // Receiver for empty messages
    receive() {
        // Handle empty messages
    }

    // Fallback receiver for all unmatched binary messages
    receive(msg: Slice) {
        // Handle fallback binary messages
    }
}
