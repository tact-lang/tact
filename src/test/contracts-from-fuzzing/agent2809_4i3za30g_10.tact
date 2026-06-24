struct InnerMost {
    value: Int = 42;
}

struct Inner {
    innerMost: InnerMost;
}

struct Outer {
    inner: Inner;
}

contract InitDeep {
    deep: Outer;

    init() {
        self.deep = Outer{ inner: Inner{ innerMost: InnerMost{} } };
    }
}