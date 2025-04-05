message TestMessage {
    value: Int?;
}

contract TestContract {
    receive(msg: TestMessage) {
        let x = msg.value;
    }
}
