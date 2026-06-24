message MyMessage {
    value: Int;
}

contract TestMsgTyped {
    // Test for a receiver that matches a typed binary message using a proper message type definition
    receive(msg: MyMessage) {
        // Minimal body
    }
}
