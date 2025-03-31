message MyMsg { a: Int; }

contract Test {
    // 1. Empty message receiver
    receive() {
        // Handle empty messages
    }

    // 2. Receiver for specific comment "hello"
    receive("hello") {
        // Handle messages with comment "hello"
    }

    // 3. Receiver for arbitrary text messages
    receive(str: String) {
        // Handle arbitrary text messages
    }

    // 4. Receiver for typed binary messages
    receive(msg: MyMsg) {
        // Handle binary message of type MyMsg
    }

    // 5. Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // Fallback handling
    }
}
