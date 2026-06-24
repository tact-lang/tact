message MyMessage {
    value: Int;
}

contract TestReceiverOrder {
    // The order of receiver declarations is intentionally scrambled to test that the matching order follows the documented priority:
    // 1. empty message receiver
    // 2. specific text receiver
    // 3. arbitrary text message receiver
    // 4. typed binary message receiver
    // 5. fallback receiver (Slice)

    receive(msg: Slice) {
        // fallback receiver for unmatched binary messages
    }

    receive(str: String) {
        // arbitrary text message receiver
    }

    receive("text") {
        // specific text message receiver for "text"
    }

    receive() {
        // empty message receiver
    }

    receive(msg: MyMessage) {
        // typed binary message receiver
    }
}
