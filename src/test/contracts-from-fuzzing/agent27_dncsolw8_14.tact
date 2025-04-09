message MyMsg {
    a: Int;
}

contract Test {
    // Specific text receiver
    receive("ping") {
        // handle message with text "ping"
    }

    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // handle any binary message that didn't match earlier receivers
    }

    // Empty message receiver
    receive() {
        // handle empty messages
    }

    // Arbitrary text receiver
    receive(msg: String) {
        // handle any arbitrary text message
    }

    // Typed binary message receiver
    receive(msg: MyMsg) {
        // handle MyMsg type messages
    }
}
