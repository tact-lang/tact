message MyMsg {
    x: Int;
}

contract TestReceiverReorder {
    // Arbitrary text message receiver (declared first but will be matched later based on fixed ordering)
    receive(str: String) {
        // Handle arbitrary text messages
    }

    // Specific text message receiver
    receive("hello") {
        // Handle a specific text comment "hello"
    }

    // Empty message receiver
    receive() {
        // Handle empty internal messages
    }

    // Fallback for unmatched binary messages
    receive(msg: Slice) {
        // Handle all unmatched binary messages
    }

    // Typed binary message receiver
    receive(msg: MyMsg) {
        // Handle typed binary messages of type MyMsg
    }
}
