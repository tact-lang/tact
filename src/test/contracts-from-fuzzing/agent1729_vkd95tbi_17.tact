struct InnerA {
    x: Int;
}

struct InnerB {
    y: Int;
}

struct Wrapper {
    a: InnerA;
    b: InnerB;
}

contract NestedMultiple {
    nested: Wrapper;

    init() {
        self.nested = Wrapper{
            a: InnerA{ x: 42 },
            b: InnerB{ y: 24 }
        };
    }
}