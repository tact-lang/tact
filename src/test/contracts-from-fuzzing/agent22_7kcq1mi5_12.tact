message MyMessage {
    value: Int;
}

contract Test {
    receive(msg: MyMessage) {
        let value = msg.value;
    }
}