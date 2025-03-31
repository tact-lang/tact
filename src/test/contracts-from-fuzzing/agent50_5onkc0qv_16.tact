message MyMessage {
    a: Int;
}

contract Test {
    // Valid typed binary message receiver using a 'message' type
    receive(msg: MyMessage) {
        // message-specific handling
    }

    // Fallback receiver for all other binary messages
    receive(msg: Slice) {
    }
}
