message MyMessage {
    value: Int;
}

contract Test {
    // Receiver for a typed binary message using a declared message type
    receive(msg: MyMessage) {
        let x: Int = msg.value + 1;
    }
}
