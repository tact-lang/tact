struct X {
    i: Int;
}

contract DupVars {
    a: X;
    b: X;
    c: X;
    d: X;

    init() {
        self.a = X{ i: 1 };
        self.b = X{ i: 2 };
        self.c = X{ i: 3 };
        self.d = X{ i: 4 };
    }
}