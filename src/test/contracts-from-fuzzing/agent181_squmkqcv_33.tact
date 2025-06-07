struct SInner {
    s: String?;
}

struct SWrap {
    inner: SInner?;
}

contract OptStringChain {
    chain: SWrap;

    init() {
        self.chain = SWrap{
            inner: null
        };
    }
}
