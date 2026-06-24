message M {
    a: Int;
    b: Int;
}

contract Test {
    receive(msg: M) {
        let x = msg.a;
    }
}