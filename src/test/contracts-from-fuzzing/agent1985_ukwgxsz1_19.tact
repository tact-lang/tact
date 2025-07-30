struct StructA {
    a: Int;
}

struct StructB {
    b: Int;
}

struct StructC {
    c1: StructA;
    c2: StructB;
}

contract MultiStructNested {
    data: StructC;

    init() {
        self.data = StructC{
            c1: StructA{ a: 7 },
            c2: StructB{ b: 8 },
        };
    }
}
