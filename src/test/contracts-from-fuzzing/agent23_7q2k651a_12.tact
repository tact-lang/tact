message MyMsg {
    data: Int
}

contract TestReordered {
    // Receiver for arbitrary text messages
    receive(str: String) {
        // This should catch arbitrary text messages
    }

    // Fallback receiver for binary messages
    receive(msg: Slice) {
        // Fallback handler
    }

    // Receiver for specific text "hey"
    receive("hey") {
        // Handles only messages with exact text "hey"
    }

    // Receiver for typed binary message
    receive(msg: MyMsg) {
        // Handles messages of type MyMsg
    }

    // Receiver for empty message
    receive() {
        // Handles empty messages
    }

    get fun dummy(): Int {
        return 7;
    }
}
