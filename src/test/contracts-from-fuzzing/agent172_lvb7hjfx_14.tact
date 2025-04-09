struct S {
    a: Int;
}

contract Test {
    a: S;
    b: S;
    c: S;
    d: S;

    init() {
        self.a = S{ a: 1 };
        self.b = S{ a: 2 };
        self.c = S{ a: 3 };
        self.d = S{ a: 4 };
    }
}