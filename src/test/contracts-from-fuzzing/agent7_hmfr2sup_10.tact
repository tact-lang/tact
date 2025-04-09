message MyMessage {
    a: Int;
}

contract Test {
    // Test 10: Receiver for typed binary message using a custom message declared with "message"
    receive(msg: MyMessage) {
        // Minimal implementation
    }
    
    fun dummy() {}
}
