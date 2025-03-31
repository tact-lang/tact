message Msg { data: Int; }

contract Test {
    // Receiver for empty messages
    receive() {
        // Process empty messages
    }

    // Receiver for specific text comment "hello"
    receive("hello") {
        // Process message if comment is "hello"
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        // Process arbitrary text messages
    }

    // Receiver for typed binary messages
    receive(msg: Msg) {
        // Process typed binary message
    }

    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // Fallback processing
    }
}
