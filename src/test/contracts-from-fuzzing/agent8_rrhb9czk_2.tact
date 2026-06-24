message TestMessage {
    value1: Int;
    value2: Bool;
}

contract TestContract {
    receive(msg: TestMessage) {
        let x = msg.value1;
        let y = msg.value2;
    }
}
