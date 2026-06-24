struct SInner {
    val: Int;
}

struct SWrap {
    inside: SInner?;
}

contract OptOpt {
    chain: SWrap?;

    init() {
        self.chain = null;
    }
}
