message MyMessage {
    value: Int;
}

contract Test {
    last: Int = 0;

    // Receiver for typed binary message
    receive(msg: MyMessage) {
        self.last = msg.value;
    }
}
