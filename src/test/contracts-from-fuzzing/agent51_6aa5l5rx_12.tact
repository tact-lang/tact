message MyMessage {
    value: Int;
}

contract Test {
    // Receiver for typed binary messages
    receive(msg: MyMessage) {
        // Using the message field
        let x: Int = msg.value;
    }
}
