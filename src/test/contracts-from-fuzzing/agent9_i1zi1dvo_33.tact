struct S1 {
    a: Int;
}

struct S2 {
    s1: S1;
}

contract InitOrder {
    s2: S2;
    init() {
        self.s2 = S2 { s1: S1 { a: 123 } };
    }
}