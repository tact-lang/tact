contract Test {
    // Receiver that handles a specific text comment "sample"
    receive("sample") {
        // Specific handling
    }

    // Receiver that handles arbitrary text messages
    receive(str: String) {
        // General handling
    }

    // Receiver for empty messages
    receive() {
        // Empty message handling
    }

    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // Fallback handling
    }
}
