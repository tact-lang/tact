message MyMsg {
    value: Int;
}

contract TestTyped {
    received: Int = 0;

    // Receiver for typed binary messages using a message definition
    receive(msg: MyMsg) {
        self.received = msg.value;
    }
}
