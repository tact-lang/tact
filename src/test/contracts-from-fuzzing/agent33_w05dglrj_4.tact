message OptionalMessage {
    value: Int?;
}

contract MessageContract {
    receive(msg: OptionalMessage) {
        let x = msg.value;
    }
}
