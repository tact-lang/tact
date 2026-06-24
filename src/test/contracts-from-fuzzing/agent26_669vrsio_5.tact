message MyMessage {
    a: Int;
}

contract TestTypedReceiver {
    // Test for typed binary message receiver using a valid message type
    receive(msg: MyMessage) {
        // Code for specific typed message matching MyMessage
    }
}
