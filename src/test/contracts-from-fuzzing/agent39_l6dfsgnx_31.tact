struct S {
    v: Int;
}

contract Test {
    receive() {
        let s: S = S{v: 1};
        s.v = 2;
    }
}