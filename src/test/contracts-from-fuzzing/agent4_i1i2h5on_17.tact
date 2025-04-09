struct S {
    x: Int;
}

contract TestContract {
    a: S;
    b: S;
    c: S;
    d: S;

    init() {
        self.a = S { x: 1 };
        self.b = S { x: 2 };
        self.c = S { x: 3 };
        self.d = S { x: 4 };
    }
}
