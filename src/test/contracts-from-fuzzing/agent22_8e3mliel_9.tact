struct S {
    a: Int;
}

message M {
    s: S;
}

contract Test {
    receive(msg: M) {
        let y = msg.s.a;
    }
}