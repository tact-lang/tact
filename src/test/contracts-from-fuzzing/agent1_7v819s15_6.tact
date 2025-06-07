message MyMessage {
    a: Int;
}

contract Test4 {
    // Test 4: Typed binary message receiver using a custom message type
    // This should handle messages that are of type MyMessage
    receive(msg: MyMessage) {
        let _ = msg.a; // Access field
    }
}
