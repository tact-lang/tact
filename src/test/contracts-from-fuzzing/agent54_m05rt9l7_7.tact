message MyMessage {
    a: Int;
}

contract TestTypedReceiver {
    executed: Int = 0;

    // Receiver for typed binary messages
    receive(msg: MyMessage) {
        self.executed = msg.a;
    }
}
