struct S1 {
    a: Int;
    b: Int?;
}

struct S2 {
    c: S1;
    d: Int;
}

contract TestContract {
    s2: S2;

    init() {
        self.s2 = S2{ c: S1{ a: 5, b: null }, d: 9 };
    }
}