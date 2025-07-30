message MyMessage {
    value: Int;
}

contract Test {
    // Test 7: Typed binary message receiver using externally defined message type
    receive(msg: MyMessage) {
        // Triggered when a binary message of type MyMessage is received
    }
}
