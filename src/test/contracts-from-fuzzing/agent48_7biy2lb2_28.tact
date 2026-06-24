struct S {
    a: Int?;
    b: Int;
}

contract TestContract {
    s1: S;
    s2: S;

    init() {
        self.s1 = S { a: null, b: 10 };
        self.s2 = S { a: 20, b: 30 };
    }
}