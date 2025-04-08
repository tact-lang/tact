struct NestedStringOpt {
    s1: String?;
    s2: String?;
}

struct NestedInts {
    i1: Int;
    i2: Int?;
}

struct Composition {
    ns: NestedStringOpt;
    ni: NestedInts;
}

contract StructsWithOptionals {
    field: Composition;

    init() {
        self.field = Composition{
            ns: NestedStringOpt{ s1: null, s2: "hello" },
            ni: NestedInts{ i1: 5, i2: null }
        };
    }
}