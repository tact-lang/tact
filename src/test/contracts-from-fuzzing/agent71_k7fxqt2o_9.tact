contract Test {
    // Case 1: Receiver for empty messages
    receive() {
        // handle empty message
    }

    // Case 2: Receiver for specific text comment messages
    receive("hello") {
        // handle specific comment
    }

    // Case 3: Receiver for arbitrary text messages
    receive(str: String) {
        // handle any text message
    }

    // Case 5: Fallback receiver for binary messages
    receive(msg: Slice) {
        // handle non-text binary message
    }
}
