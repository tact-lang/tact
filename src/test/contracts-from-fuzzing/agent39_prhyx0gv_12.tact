message MyMessage {
    v: Int;
}

contract Test {
    // Test: Receiver for a binary message of type MyMessage
    receive(msg: MyMessage) {
        // do nothing
    }
}
