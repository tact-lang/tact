message MyMessage {
    value: Int;
}

contract TestReceiverOrder {
    // Receiver for binary messages as fallback
    receive(msg: Slice) {
        // fallback handler
    }

    // Receiver for specific text message
    receive("hello") {
        // handler for "hello" messages
    }

    // Receiver for arbitrary text messages
    receive(str: String) {
        // handler for arbitrary string messages
    }

    // Receiver for empty messages
    receive() {
        // handler for empty messages
    }

    // Receiver for typed binary messages using MyMessage structure
    receive(msg: MyMessage) {
        // handler for typed messages
    }

    // Getter to ensure full compilation
    get fun test(): Int {
        return 42;
    }
}
