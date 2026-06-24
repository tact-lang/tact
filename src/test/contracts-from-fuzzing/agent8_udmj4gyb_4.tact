struct InnerMost {
    val: Int;
}

struct MiddleOptional {
    deep: InnerMost?;
}

contract TestContract {
    nested: MiddleOptional?;

    init() {
        self.nested = MiddleOptional{
            deep: InnerMost{
                val: 42,
            },
        };
    }
}
