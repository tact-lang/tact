message MyMsg {
    value: Int;
}

contract Test4 {
    // Test Case 4: Receiver with typed binary message using a message type
    receive(msg: MyMsg) {
        // Handle typed binary message
    }
}
