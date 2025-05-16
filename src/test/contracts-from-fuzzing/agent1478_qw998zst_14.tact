struct S4 {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
}

contract TestContract {
    f1: S4;
    f2: S4;
    f3: S4;

    init() {
        self.f1 = S4{ a: 1, b: true, c: null, d: false };
        self.f2 = S4{ a: 2, b: false, c: 3, d: null };
        self.f3 = S4{ a: 3, b: true, c: 4, d: true };
    }
}
