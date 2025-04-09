struct StructA {
    a: Int;
}

struct StructB {
    b: Int;
}

contract DifferentStructs {
    s1: StructA;
    s2: StructB;
    init() {
        self.s1 = StructA{ a: 1 };
        self.s2 = StructB{ b: 2 };
    }
}