message MyMessage {
    x: Int;
}

contract Test {
    receive(msg: MyMessage) {
        // Receiver for typed binary messages
    }
}
