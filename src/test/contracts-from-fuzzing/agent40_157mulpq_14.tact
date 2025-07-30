message MyMessage {
    a: Int;
}

contract Test {
    // Test 13a: Receiver for a typed binary message using a message type.
    receive(msg: MyMessage) {}
}
