struct DeepNested {
    inner: InnerLayer;
}

struct InnerLayer {
    optInner: InnerMost?;
}

struct InnerMost {
    val: Int;
}

contract NestedContract {
    data: DeepNested;
    init() {
        self.data = DeepNested{
            inner: InnerLayer{
                optInner: InnerMost{val: 123}
            }
        };
    }
}