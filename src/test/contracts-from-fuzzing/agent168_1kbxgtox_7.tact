message MyMessage {
    a: Int;
}

contract Test {
    // Test for typed binary message receiver
    receive(msg: MyMessage) {
        // This receiver should match a binary message of type MyMessage
    }
}
