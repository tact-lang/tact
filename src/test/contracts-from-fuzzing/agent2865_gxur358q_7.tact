struct InnerA {
    a1: Int;
    a2: Bool;
}

struct InnerB {
    b1: String;
    b2: Int?;
}

struct Container {
    innerA: InnerA;
    innerB: InnerB;
    num: Int;
}

contract NestedStructs {
    data: Container;

    init() {
        self.data = Container{
            innerA: InnerA{ a1: 1, a2: true },
            innerB: InnerB{ b1: "x", b2: null },
            num: 42
        };
    }
}