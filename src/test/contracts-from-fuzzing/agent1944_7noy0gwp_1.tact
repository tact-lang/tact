struct InnerMost {
    flag: Bool;
}

struct Inner {
    num: Int;
    maybeInnerMost: InnerMost?;
}

contract NestedOptionalsTest {
    nested: Inner?;

    init() {
        self.nested = null;
    }
}