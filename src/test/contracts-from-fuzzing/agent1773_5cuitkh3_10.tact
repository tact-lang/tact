struct StructA {
    a1: Int;
    a2: Int;
}

struct StructB {
    b1: Int;
    b2: StructA;
}

struct StructC {
    c1: StructB;
    c2: Int;
}

contract MultiNested {
    data: StructC;

    init() {
        self.data = StructC{
            c1: StructB{ b1:1, b2: StructA{ a1:2, a2:3 } },
            c2:4
        };
    }
}