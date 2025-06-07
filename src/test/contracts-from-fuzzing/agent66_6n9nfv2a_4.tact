message MyMessage {
    value: Int;
}

contract Test4 {
    // Receiver for binary message with specific type
    receive(msg: MyMessage) {
        // Just for compilation
        let x = msg.value + 1;
    }
}
