message MyMsg {
    a: Int;
}

contract AllReceiverTest {
    // Receives arbitrary text messages
    receive(str: String) {
        // implementation
    }

    // Fallback receiver for unmatched binary messages
    receive(msg: Slice) {
        // implementation
    }

    // Receives empty messages
    receive() {
        // implementation
    }

    // Receives messages with specific text comment "abc"
    receive("abc") {
        // implementation
    }

    // Receivers for typed binary messages
    receive(msg: MyMsg) {
        // implementation
    }
}
