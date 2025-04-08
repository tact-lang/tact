struct StructA {
    a: Int;
}

struct StructB {
    b: Int;
    sa: StructA;
}

contract MixedOrder {
    aa: StructA;
    bb: StructB;

    init() {
        self.aa = StructA{ a: 1 };
        self.bb = StructB{ b: 2, sa: StructA{ a: 3 } };
    }
}