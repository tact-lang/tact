struct InnerMost {
    deepVal: Int? = 999;
}

struct Mid {
    inner: InnerMost?;
}

contract StorageTest {
    nested: Mid?;

    init() {
        self.nested = Mid{
            inner: InnerMost{
                deepVal: null
            }
        };
    }
}