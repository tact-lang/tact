message InternalMessage {
    value: Int;
}

contract TestContract {
    receive(msg: InternalMessage) {
        let x = msg.value;
    }
}