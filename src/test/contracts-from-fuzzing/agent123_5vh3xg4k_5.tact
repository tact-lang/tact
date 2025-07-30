message TestMsg {
    a: Int;
    b: Int;
}

contract Test {
    receive(msg: TestMsg) {
        let s = msg.a + msg.b;
    }
}
