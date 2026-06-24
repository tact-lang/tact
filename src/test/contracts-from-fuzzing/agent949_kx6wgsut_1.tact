struct DeepNested {
    inner: NestedLayer;
}

struct NestedLayer {
    optionalInner: InnerMost?;
}

struct InnerMost {
    val1: Int;
    val2: Bool;
}

contract NestTester {
    data: DeepNested;

    init() {
        self.data = DeepNested{
            inner: NestedLayer{
                optionalInner: InnerMost{
                    val1: 42,
                    val2: true,
                }
            }
        };
    }
}
