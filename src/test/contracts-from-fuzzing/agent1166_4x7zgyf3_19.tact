struct S_A {
    a: Int;
    b: Bool;
}

struct S_B {
    s1: S_A;
    s2: S_A;
}

contract ReuseStructs {
    s: S_B;

    init() {
        self.s = S_B{
            s1: S_A{a: 1, b: true},
            s2: S_A{a: 2, b: false}
        };
    }
}
