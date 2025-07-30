message OptionalMessage {
    value: Int?;
}

contract TestContract {
    receive(msg: OptionalMessage) {
    }
}