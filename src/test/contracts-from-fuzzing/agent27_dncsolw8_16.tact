contract Test {
    // Fallback receiver for binary messages
    receive(msg: Slice) {
        // handle binary messages
    }

    // Arbitrary text receiver
    receive(msg: String) {
        // handle arbitrary text messages
    }

    // Specific text receiver
    receive("hello") {
        // handle specific text 'hello'
    }

    // Empty message receiver
    receive() {
        // handle empty messages
    }
}
