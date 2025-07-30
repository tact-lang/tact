struct StructA {
    a: Int;
}

struct StructB {
    b: Int;
    s: StructA;
}

contract DifferentOrder {
    s: StructB;
    init() {
        self.s = StructB{
            b: 1,
            s: StructA{ a: 2 }
        };
    }
}