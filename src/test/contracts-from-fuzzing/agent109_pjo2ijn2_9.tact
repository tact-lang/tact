message MyMessage {
    value: Int;
}

contract Test8 {
    // Test 8: Receiver for typed binary messages defined with a message type
    receive(msg: MyMessage) {
        // Handling binary message of type MyMessage
    }

    get fun test(): Int {
        return 42;
    }
}
