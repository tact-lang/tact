struct InnerMost {
    v: Int;
}

struct Inner {
    im: InnerMost;
}

contract Test {
    nested: Inner;

    init() {
        self.nested = Inner{im: InnerMost{v: 42}};
    }
}
