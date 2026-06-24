contract ChainedInner {
    nested: InnerMost;

    init() {
        self.nested = InnerMost{
            a: 1,
            b: 2,
            c: 3,
            d: 4,
        };
    }
}

struct InnerMost {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
}
