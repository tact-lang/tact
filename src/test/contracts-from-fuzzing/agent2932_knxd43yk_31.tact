struct InnerA {
    a1: Int;
    a2: Int;
}

struct InnerB {
    b1: Int;
    b2: Bool;
}

struct Outer {
    innerA: InnerA;
    innerB: InnerB;
}

contract StructsInStructs {
    data: Outer;
    init() {
        self.data = Outer{
            innerA: InnerA{ a1: 1, a2: 2 },
            innerB: InnerB{ b1: 3, b2: true }
        };
    }
}