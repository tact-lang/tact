struct StructA {
    p: Int;
}

struct StructB {
    q: Int;
}

contract DisjointStructs {
    a: StructA;
    b: StructB;

    init() {
        self.a = StructA{p: 99};
        self.b = StructB{q: 100};
    }
}
