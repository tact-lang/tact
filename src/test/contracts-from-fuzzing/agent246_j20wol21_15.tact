struct RecA {
    val: Int;
}

struct RecB {
    a1: RecA;
    a2: RecA;
    a3: RecA;
}

contract SeveralSameStructs {
    f1: RecA;
    f2: RecB;

    init() {
        self.f1 = RecA{val: 7};
        self.f2 = RecB{
            a1: RecA{val:1},
            a2: RecA{val:2},
            a3: RecA{val:3},
        };
    }
}