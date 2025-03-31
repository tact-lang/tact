message MyMessage {
    value: Int;
}

contract Test16 {
    // Test 16: Using underscore to discard parameter in a typed binary message receiver
    receive(_: MyMessage) {
        // This receiver ignores the received message
    }
}
