struct InnerMost {
    value: Int;
}

struct Inner {
    innerMost: InnerMost;
}

struct Outer {
    inner: Inner;
}

contract DeepContract {
    item: Outer;

    init() {
        self.item = Outer{
            inner: Inner{
                innerMost: InnerMost{
                    value: 77
                }
            }
        };
    }
}