struct S {
    x: Int;
}

message M {
    s: S;
}

contract Test {
    receive() {
        let m: M = M { s: S { x: 2 } };
    }
}