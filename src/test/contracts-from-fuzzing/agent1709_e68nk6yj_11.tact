struct NestedA {
    a1: Int;
    a2: Bool;
}

struct NestedB {
    b1: Int;
    b2: NestedA;
}

struct NestedC {
    c1: NestedB;
    c2: NestedA;
    c3: Bool;
}

contract DeepMultiNested {
    val: NestedC;
    init() {
        self.val = NestedC{
            c1: NestedB{
                b1: 55,
                b2: NestedA{ a1: 11, a2: true },
            },
            c2: NestedA{ a1: 22, a2: false },
            c3: true,
        };
    }
}