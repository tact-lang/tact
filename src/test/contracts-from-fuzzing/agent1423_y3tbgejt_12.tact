struct StructA {
    a: Int;
}

struct StructB {
    b: Int;
}

contract MultiStructs {
    s1: StructA;
    s2: StructB;
    init() {
        self.s1 = StructA{ a: 42 };
        self.s2 = StructB{ b: 24 };
    }
}