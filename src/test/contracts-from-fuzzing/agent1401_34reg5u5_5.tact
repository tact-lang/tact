struct Inner {
    a: Int;
    b: Int;
}

struct Outer {
    inner1: Inner;
    inner2: Inner;
    optInner: Inner?;
}

contract NestedManyTimes {
    nested: Outer;

    init() {
        self.nested = Outer{
            inner1: Inner{ a: 1, b: 2 },
            inner2: Inner{ a: 3, b: 4 },
            optInner: Inner{ a: 5, b: 6 }
        };
    }
}