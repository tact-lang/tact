struct S {
    a: Int;
    b: Int;
}

contract C {
    f1: Int;
    s: S;
    f2: Bool = true;

    init() {
        self.f1 = 1;
        self.s = S{ a:2, b:3 };
    }
}