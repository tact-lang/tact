message MyMessage {
    value: Int;
}

contract Test {
    receive(msg: MyMessage) {
        // Using the message field in an expression to avoid unused variable warning
        let _ = msg.value + 0;
    }
}
