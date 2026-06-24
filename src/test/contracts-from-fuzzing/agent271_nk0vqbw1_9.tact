struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    c: Int?;
    d: Bool?;
}

contract TestContract {
    f1: S1;
    f2: S2;

    init() {
        self.f1 = S1{ a: 1, b: true };
        self.f2 = S2{ c: null, d: false };
    }
}