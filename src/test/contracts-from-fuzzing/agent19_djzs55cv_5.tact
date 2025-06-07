message OptionalMessage {
    value: Int?;
}

contract TestContract {
    receive(msg: OptionalMessage) {
        let x = msg.value;
    }
}