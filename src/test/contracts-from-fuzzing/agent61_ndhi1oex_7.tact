message MyMessage {
    value: Int;
}

contract Test {
    lastReceived: Int = 0;

    // Typed binary message receiver; receives binary messages of type MyMessage
    receive(msg: MyMessage) {
        self.lastReceived = msg.value;
    }
}
