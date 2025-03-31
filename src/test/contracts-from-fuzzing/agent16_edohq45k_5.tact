message MyMessage {
    value: Int;
}

contract Test {
    receive(msg: MyMessage) {
        let x: Int = msg.value;
    }
}
