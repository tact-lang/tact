message MyMessage {
    a: Int;
}

contract Test {
    // Test 4: Typed binary message receiver using a valid message type
    // According to the documentation (), this should compile and work correctly
    receive(msg: MyMessage) {
        // Code body is empty
    }
}
