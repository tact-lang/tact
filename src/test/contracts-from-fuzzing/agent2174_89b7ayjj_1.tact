struct DeepNested {
    inner: NestedOpt;
}

struct NestedOpt {
    val1: Int?;
    val2: Int?;
    sub: InnerMost?;
}

struct InnerMost {
    a: Int;
    b: Bool;
}

contract TestContract {
    nested: DeepNested;
    init() {
        self.nested = DeepNested{
            inner: NestedOpt{
                val1: null,
                val2: 123,
                sub: InnerMost{
                    a: 7,
                    b: true
                }
            }
        };
    }
}
