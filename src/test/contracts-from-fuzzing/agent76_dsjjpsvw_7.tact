message MyMessage {
    value: Int;
}

contract Test {
    // Test 5: Receiver function that expects a typed binary message
    // This should match if a message of type MyMessage is received.
    receive(msg: MyMessage) {
        // No operation
    }
}
