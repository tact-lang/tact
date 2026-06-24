message MyMessage {
    value: Int;
}

contract Test {
    // Test 10b: Receiver for a typed binary message using a proper message type declaration
    receive(msg: MyMessage) {}
}
