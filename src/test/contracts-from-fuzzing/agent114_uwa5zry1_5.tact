message MyMessage {
    value: Int;
}

contract Test {
    // Receiver for typed binary message
    receive(msg: MyMessage) {
    }
}
