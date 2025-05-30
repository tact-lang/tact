struct InnerMost {
    val: Int;
}

struct Inner {
    innerMost: InnerMost;
}

struct Outer {
    inner: Inner;
}

contract MultiLayerNest {
    data: Outer;

    init() {
        self.data = Outer{
            inner: Inner{
                innerMost: InnerMost{
                    val: 123,
                }
            }
        };
    }
}
