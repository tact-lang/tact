message MyMessage {
    value: Int;
}

contract Test {
    // Receiver for a typed binary message using a declared message type
    receive(msg: MyMessage) {
        // Access the value field to ensure the receiver is compiled
        let x = msg.value;
    }
}
