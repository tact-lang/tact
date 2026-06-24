struct InnerMost {
    leaf: Int;
}

struct Inner {
    nested: InnerMost;
    optNested: InnerMost?;
}

struct Outer {
    inner: Inner;
}

contract TestContract {
    storage: Outer;

    init() {
        self.storage = Outer{
            inner: Inner{
                nested: InnerMost{ leaf: 1 },
                optNested: null,
            },
        };
    }
}