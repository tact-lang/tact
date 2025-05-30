message MyMessage {
    value: Int;
}

contract Test {
    // Typed binary message receiver: should match messages in the MyMessage format
    receive(msg: MyMessage) {
        let x = msg.value;
    }
}
