message Msg {
    a: Int;
    b: Int;
}

contract Test {
    receive(msg: Msg) {
        let x = msg.a + msg.b;
    }
}