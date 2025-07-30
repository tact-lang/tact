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

contract MultiStructPersist {
    data: StructC = StructC{
        c1: StructA{ a: 3 },
        c2: StructB{ b: 7 }
    };
}