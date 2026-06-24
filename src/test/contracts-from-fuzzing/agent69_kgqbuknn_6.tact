message MyMessage {
    value: Int;
}

contract Test4 {
    receive(msg: MyMessage) {
        // Test receiver for typed binary message
    }
}
