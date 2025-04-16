struct StructA {
    f: Int;
}

struct StructB {
    a: StructA;
}

struct StructC {
    b: StructB;
}

struct StructD {
    c: StructC;
}

struct StructE {
    d: StructD;
}

contract UltraDeep {
    nested: StructE;

    init() {
        self.nested = StructE{ d: StructD{ c: StructC{ b: StructB{ a: StructA{ f: 100 } } } } };
    }
}
