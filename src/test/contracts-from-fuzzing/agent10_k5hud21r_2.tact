message TestMessage {
    a: Int;
}

contract Test {
    receive(msg: TestMessage) {
    }
}