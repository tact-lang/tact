struct StructA {
    a1: Int;
}

struct StructB {
    b1: StructA;
}

struct StructC {
    c1: StructB;
}

contract DeepChain {
    root: StructC;

    init() {
        self.root = StructC{ c1: StructB{ b1: StructA{ a1: 7 } } };
    }
}