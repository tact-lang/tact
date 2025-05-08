message SimpleMessage {
    value: Int;
}

contract MessageContract {
    receive(msg: SimpleMessage) {
        let x = msg.value;
    }
}
