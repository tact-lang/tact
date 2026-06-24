struct StructA {
    a1: Int;
    a2: Int?;
}

struct StructB {
    b1: Bool;
    b2: StructA;
    b3: Int;
}

contract Test {
    f1: StructB;

    init() {
        self.f1 = StructB{
            b1: true,
            b2: StructA{ a1: 42, a2: null },
            b3: 7
        };
    }
}