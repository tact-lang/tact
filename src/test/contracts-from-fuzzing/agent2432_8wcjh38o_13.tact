struct S {
    value: Int as uint1;
}

contract Test {
    s: S;
    init() {
        self.s = S{value:1};
    }
}