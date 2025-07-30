struct InnerMost {
    val: Int?;
}

struct InnerOpt {
    innerMost: InnerMost?;
}

struct NestedOpt {
    inner: InnerOpt?;
}

contract TestContract {
    nested: NestedOpt;
    init() {
        self.nested = NestedOpt{
            inner: InnerOpt{
                innerMost: InnerMost{val:7}
            }
        };
    }
    receive() {
        self.nested = self.nested;
    }
}