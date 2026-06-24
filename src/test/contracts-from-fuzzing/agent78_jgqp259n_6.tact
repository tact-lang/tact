struct Inner {
    f1: Int;
    f2: Bool;
    f3: Bool?;
}

struct MultiNested {
    i1: Inner;
    i2: Inner;
    i3: Inner;
}

contract LotOfNested {
    nested: MultiNested;

    init() {
        self.nested = MultiNested {
            i1: Inner{ f1: 1, f2: true, f3: null },
            i2: Inner{ f1: 2, f2: false, f3: true },
            i3: Inner{ f1: 3, f2: true, f3: false },
        };
    }
}