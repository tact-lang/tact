message MyMessage {
    value: Int;
}

contract Test {
    value: Int = 0;

    // Typed binary message receiver using a custom message type
    receive(msg: MyMessage) {
        self.value = msg.value;
    }

    // Fallback receiver for binary messages
    receive(msg: Slice) {
        self.value = -1;
    }
}
