struct InnerMost {
    x: Int;
}

struct Inner {
    im: InnerMost;
    optIm: InnerMost?;
}

struct Outer {
    inner: Inner;
    optInner: Inner?;
    flag: Bool;
}

contract NestedDeep {
    storage: Outer;

    init() {
        self.storage = Outer{
            inner: Inner{
                im: InnerMost{ x: 5 },
                optIm: null,
            },
            optInner: null,
            flag: true,
        };
    }
}
