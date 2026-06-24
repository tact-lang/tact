message MyMessage {
    value: Int;
}

contract TestTypedReceiver {
    last: Int = 0;

    // This receiver should match when a MyMessage is received
    receive(msg: MyMessage) {
        self.last = msg.value;
    }

    // Fallback receiver for all unmatched binary messages
    receive(msg: Slice) {
        self.last = -1;
    }
}
