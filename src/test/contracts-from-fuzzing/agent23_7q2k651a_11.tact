message MyMsg {
    data: Int
}

contract Test {
    // 1. Receiver for empty messages
    receive() {
        // Handles empty inbound messages
    }

    // 2. Receiver for messages with specific text comment "hello"
    receive("hello") {
        // Handles messages with exact text "hello"
    }

    // 3. Receiver for arbitrary text messages
    receive(str: String) {
        // Handles any text message
    }

    // 4. Receiver for typed binary messages
    receive(msg: MyMsg) {
        // Handles binary messages of type MyMsg
    }

    // 5. Receiver for unmatched binary messages (fallback)
    receive(msg: Slice) {
        // Handles all other binary messages
    }

    // Dummy getter to ensure the contract is fully compiled
    get fun dummy(): Int {
        return 100;
    }
}
