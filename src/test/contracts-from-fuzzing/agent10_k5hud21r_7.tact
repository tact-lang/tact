message TestMessage {
    a: Int;
}

contract Test {
    receive(msg: TestMessage) {
        let ctx = context();
        let a = msg.a;
    }
}