message MyMessage {
    x: Int;
}

contract Test8 {
    // This contract tests the receiver for a binary message of type MyMessage
    receive(msg: MyMessage) {
        // Handling typed binary message
    }
}
