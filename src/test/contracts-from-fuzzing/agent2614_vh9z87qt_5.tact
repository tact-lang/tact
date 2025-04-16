struct StructA {
    val: Int;
}

struct StructB {
    nested: StructA;
}

contract ContractCycle {
    ref1: StructA;
    ref2: StructB;

    init() {
        self.ref1 = StructA{val: 1};
        self.ref2 = StructB{nested: self.ref1};
    }
}