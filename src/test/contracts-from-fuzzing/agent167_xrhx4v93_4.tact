message MyMessage {
    value: Int;
}

contract Test {
    receive(msg: MyMessage) {
        // Simple assignment to illustrate typed binary message receiver
        let x = msg.value;
    }
}
