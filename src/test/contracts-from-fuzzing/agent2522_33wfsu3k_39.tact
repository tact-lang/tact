struct InnerMost {
    value: Int;
}

struct NestedOpt {
    inner: InnerMost?;
}

struct TopLevel {
    nested: NestedOpt?;
}

contract TestContract {
    data: TopLevel;

    init() {
        self.data = TopLevel { nested: null };
    }
}