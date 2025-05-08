struct InnerX {
    x: Int?;
}

struct MiddleX {
    inner: InnerX?;
}

contract OptionalChain {
    chain: MiddleX?;

    init() {
        self.chain = null;
    }
}