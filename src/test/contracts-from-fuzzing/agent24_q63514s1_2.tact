message TestMessage {
    value: Int;
}

contract TestContract {
    receive(msg: TestMessage) {
    }
}