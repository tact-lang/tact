struct InnerMost {
    data: Int;
}

struct Inner {
    val: Int?;
    deep: InnerMost?;
}

contract OptionalChain {
    chain: Inner?;

    init() {
        self.chain = Inner{
            val: null,
            deep: InnerMost{data: 123}
        };
    }
}