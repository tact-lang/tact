message SimpleMessage {
    value: String;
}

contract MessageContract {
    receive(msg: SimpleMessage) {
        let x = msg.value;
    }
}
