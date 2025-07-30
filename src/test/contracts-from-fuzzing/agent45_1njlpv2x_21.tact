struct InnerA {
    i: Int;
}

struct InnerB {
    b: Bool;
}

contract MultiNestedMix {
    sa: InnerA;
    sb: InnerB;
    optionalNested: InnerB?;

    init() {
        self.sa = InnerA{ i: 5 };
        self.sb = InnerB{ b: true };
        self.optionalNested = InnerB{ b: false };
    }
}
