struct S1 {
    a: Int;
    b: Int;
}

struct S2 {
    c: Int;
    d: Int;
}

contract TestContract {
    pair1: S1;
    pair2: S2;

    init() {
        self.pair1 = S1{ a:1, b:2 };
        self.pair2 = S2{ c:3, d:4 };
    }
}