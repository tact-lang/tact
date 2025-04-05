message OptionalMessage {
    y: Bool?;
}

contract TestContract {
    receive(msg: OptionalMessage) {
        // do nothing
    }
}