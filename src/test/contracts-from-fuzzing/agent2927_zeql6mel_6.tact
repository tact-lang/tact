struct StructA {
    a: Int;
}

struct StructB {
    b: Int;
    nested: StructA;
}

contract MultipleNested {
    s1: StructA;
    s2: StructB;

    init() {
        self.s1 = StructA{ a: 123 };
        self.s2 = StructB{ b: 456, nested: self.s1 };
    }
}