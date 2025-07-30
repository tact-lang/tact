struct InnerMost {
    z: Int;
}

struct Inner {
    y: Int;
    innerMost: InnerMost;
}

struct Outer {
    x: Int;
    inner: Inner;
}

contract ThreeLayerNested {
    storage: Outer;

    init() {
        self.storage = Outer{
            x: 1,
            inner: Inner{
                y: 2,
                innerMost: InnerMost{ z: 3 },
            },
        };
    }
}