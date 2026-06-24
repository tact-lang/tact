message MyMessage {
    value: Int;
}

contract Test {
    // Correctly declare a typed binary message receiver using a message type
    receive(msg: MyMessage) {
        let y = msg.value;
    }
}
