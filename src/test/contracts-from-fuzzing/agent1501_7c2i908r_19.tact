struct S {
    a: Int;
    b: Bool;
}

contract TestContract {
    s1: S;
    s2: S;

    init() {
        self.s1 = S{ a: 1, b: false };
        self.s2 = S{ a: 2, b: true };
    }
}