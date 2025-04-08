struct InnerMost {
    deepest: Int?
}

struct Inner {
    innerMost: InnerMost?
}

struct OuterLayer {
    inner: Inner?
}

contract MultiOptionalDeep {
    state: OuterLayer;

    init() {
        self.state = OuterLayer{
            inner: Inner{
                innerMost: InnerMost{
                    deepest: null,
                },
            },
        };
    }
}