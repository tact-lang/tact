message MyMessage {
    value: Int;
}

contract Test {
    // Testing usage of underscore in text receiver for discarding the parameter
    receive(_: String) {
        // No need to use the text parameter
    }

    // Testing usage of underscore in a typed binary receiver
    receive(_: MyMessage) {
        // Discard the message parameter
    }

    // Testing usage of underscore in fallback receiver (binary message fallback)
    receive(_: Slice) {
        // Fallback: discard the raw slice
    }

    // Testing empty message receiver (no parameter):
    receive() {
        // Handle empty message
    }
}
