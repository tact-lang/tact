message MyMessage {
    value: Int;
}

contract Test {
    // Test typed binary message receiver using the proper 'message' declaration
    receive(msg: MyMessage) {
        // Implementation for typed binary messages
    }
}