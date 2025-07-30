struct S {
    a: Int;
}

contract ResetField {
    s: S;
    init() {
        self.s = S{ a: 1 };
        self.s = S{ a: 2 };
    }
}