message MyMessage {
    value: Int;
}

contract Test {
    lastValue: Int = 0;

    // Receiver for typed binary messages of type MyMessage
    receive(msg: MyMessage) {
         self.lastValue = msg.value;
    }
}
