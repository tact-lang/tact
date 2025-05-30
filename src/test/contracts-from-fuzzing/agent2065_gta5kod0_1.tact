struct DeepNest {
    inner: Inner;
}

struct Inner {
    innerMost: InnerMost;
}

struct InnerMost {
    flag: Bool;
    count: Int;
}

contract StorageTest {
    nested: DeepNest;

    init() {
        self.nested = DeepNest{
            inner: Inner{
                innerMost: InnerMost{flag: true, count: 42}
            }
        };
    }
}
