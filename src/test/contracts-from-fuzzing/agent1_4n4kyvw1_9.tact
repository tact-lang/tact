struct S {
    x: Int;
}

message M {
    s: S;
}

contract Test {
    receive() {
        let s = S{x: 1};
        let m = M{s: s};
    }
}