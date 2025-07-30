message MyMessage {
    a: Int;
    b: Int;
}

contract Test {
    // Test receive with typed binary message
    receive(msg: MyMessage) {
        // handling binary message with type MyMessage
    }

    // Fallback empty receiver to ensure message gets compiled
    receive() {}
}
