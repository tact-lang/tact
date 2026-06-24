message TestMessage {
    a: Int;
}

contract Test {
    receive(msg: TestMessage) {
        let a = msg.a;
    }
}