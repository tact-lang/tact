struct DeeplyNested {
    inner: NestedLayer;
}

struct NestedLayer {
    value: InnerMost?;
}

struct InnerMost {
    data: Int;
    flag: Bool?;
}

contract StorageTest {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            inner: NestedLayer{
                value: InnerMost{
                    data: 42,
                    flag: true
                }
            }
        };
    }
}