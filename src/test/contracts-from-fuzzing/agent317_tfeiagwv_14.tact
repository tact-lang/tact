struct S {
    a: Int;
}

contract Test {
    s1: S;
    s2: S;

    init() {
        self.s1 = S { a: 1 };
        self.s2 = S { a: 2 };
    }
}