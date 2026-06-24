message MyMessage {
    x: Int;
}

contract Test {
    // Receiver for typed binary messages
    receive(msg: MyMessage) {
    }
}
