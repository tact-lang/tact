message MyMsg {
    a: Int;
}

contract TestMulti {
    // Receiver for empty message
    receive() {
        // Handle empty message
    }

    // Receiver for specific text "hello"
    receive("hello") {
        // Handle message with specific text
    }

    // Receiver for arbitrary text message
    receive(str: String) {
        // Handle any text message
    }

    // Receiver for typed binary message (MyMsg)
    receive(msg: MyMsg) {
        // Handle binary message of type MyMsg
    }

    // Fallback receiver for any other binary message
    receive(msg: Slice) {
        // Handle unmatched binary messages
    }
}