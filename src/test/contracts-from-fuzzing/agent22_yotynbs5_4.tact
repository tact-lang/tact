message MyMessage {
    value: Int;
}

contract TestBinaryMessage {
    // Test receiver for typed binary messages
    receive(msg: MyMessage) {
        // Ideally, we would process msg, but just a no-op for testing compilation
        let _ = msg.value;
    }
}
