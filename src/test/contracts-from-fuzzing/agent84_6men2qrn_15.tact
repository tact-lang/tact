struct StructA {
    valA: Int;
}

struct StructB {
    valB: Int;
}

struct StructC {
    innerA: StructA;
    innerB: StructB;
}

contract MultiStructTest {
    data: StructC;

    init() {
        self.data = StructC{
            innerA: StructA{ valA: 1 },
            innerB: StructB{ valB: 2 },
        };
    }
}