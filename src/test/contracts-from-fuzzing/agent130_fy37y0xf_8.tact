message MyMessage {
    a: Int;
}

contract Test {
    state: Int = 0;
    
    // Receiver for typed binary messages using MyMessage
    receive(msg: MyMessage) {
        self.state = msg.a;
    }

    // Dummy receiver for empty messages
    receive() {}
}
