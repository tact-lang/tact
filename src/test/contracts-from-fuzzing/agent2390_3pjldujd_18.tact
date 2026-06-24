contract NestedTupleSim {
    s: StructA;
    init() {
        self.s = StructA{ b: StructB{ c: StructC{ v: 3 } } };
    }
}

struct StructA {
    b: StructB;
}

struct StructB {
    c: StructC;
}

struct StructC {
    v: Int;
}