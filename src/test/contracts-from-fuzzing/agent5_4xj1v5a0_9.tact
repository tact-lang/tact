message MyMessage {
    value: Int;
}

contract MultiReceiver {
    // This contract contains all receiver types to check matching order:

    // 1. Empty message receiver
    receive() {
        // handle empty message
    }

    // 2. Specific text message receiver: for text "hello"
    receive("hello") {
        // handle specific text
    }

    // 3. Arbitrary text message receiver
    receive(str: String) {
        // handle arbitrary text
    }

    // 4. Typed binary message receiver
    receive(msg: MyMessage) {
        // handle typed binary message
    }

    // 5. Fallback binary message receiver
    receive(msg: Slice) {
        // handle unmatched binary messages
    }
}
