message SomeMsg {
    x: Int;
}

contract TestOrder {
    // Fallback receiver declared first
    receive(msg: Slice) {
        // fallback handler
    }

    // Specific text receiver
    receive("hello") {
        // handles messages with comment "hello"
    }

    // Empty message receiver
    receive() {
        // handles empty messages
    }

    // Arbitrary text receiver
    receive(str: String) {
        // handles arbitrary text messages
    }

    // Typed binary message receiver
    receive(msg: SomeMsg) {
        // handles binary messages of type SomeMsg
    }
}
