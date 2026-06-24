struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    s1_a: Int;
    s1_b: Bool;
    s1: S1;
}

contract Test {
    s: S2;

    init() {
        self.s = S2{
            s1_a: 1,
            s1_b: false,
            s1: S1{ a: 2, b: true }
        };
    }
}