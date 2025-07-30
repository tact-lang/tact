message MyMessage {
    value: Int;
}

contract Test4 {
    // Test D: Receiver for typed binary message
    receive(msg: MyMessage) {
        // Process typed binary message
        // For testing, simply do nothing
    }
}
