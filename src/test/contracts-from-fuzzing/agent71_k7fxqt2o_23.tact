contract Test {
    // Receivers declared in non-documented order to verify that declaration order does not affect matching
    // Fallback receiver for binary messages
    receive(msg: Slice) {
        // fallback binary message
    }

    // Receiver for specific fixed text comment "abc"
    receive("abc") {
        // fixed text receiver
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        // arbitrary text receiver
    }

    // Receiver for empty messages
    receive() {
        // empty message receiver
    }
}
