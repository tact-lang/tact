struct S1 {
    a: Int;
}

struct S2 {
    s1_a: Int;
    s2_extra: Bool;
}

contract StructFieldDiff {
    s1: S1;
    s2: S2;

    init() {
        self.s1 = S1{ a: 10 };
        self.s2 = S2{ s1_a: 20, s2_extra: true };
    }
}