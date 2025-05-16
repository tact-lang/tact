struct StructA {
    a1: Int;
    a2: Int;
}

struct StructB {
    b1: StructA;
    b2: StructA;
}

struct StructC {
    c1: StructB;
    c2: StructB;
}

contract WideAndDeep {
    field: StructC;

    init() {
        self.field = StructC{
            c1: StructB{ b1: StructA{a1:1, a2:2}, b2: StructA{a1:3, a2:4} },
            c2: StructB{ b1: StructA{a1:5, a2:6}, b2: StructA{a1:7, a2:8} },
        };
    }
}