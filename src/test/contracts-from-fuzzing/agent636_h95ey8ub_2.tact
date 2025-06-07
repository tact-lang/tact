struct DeeplyNested {
    inner: Inner;
}

struct Inner {
    innerMost: InnerMost;
}

struct InnerMost {
    flag: Bool;
}

contract NestedStructStorage {
    nested: DeeplyNested;

    init() {
        self.nested = DeeplyNested{
            inner: Inner{
                innerMost: InnerMost{
                    flag: true
                }
            }
        };
    }
}