struct InnerMost {
    flag: Bool;
}

struct Inner {
    count: Int;
    innerMost: InnerMost;
}

struct Outer {
    number: Int;
    inner: Inner;
}

contract Test3 {
    nested: Outer;
    init() {
        self.nested = Outer {
            number: 42,
            inner: Inner {
                count: 5,
                innerMost: InnerMost { flag: true }
            }
        };
    }
}