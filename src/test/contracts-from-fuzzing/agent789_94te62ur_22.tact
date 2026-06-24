struct OptionalChainInner {
    val: Int?;
}

struct OptionalChainMid {
    inner: OptionalChainInner?;
}

struct OptionalChainOuter {
    mid: OptionalChainMid?;
}

contract OptionalChainTest {
    opt: OptionalChainOuter;

    init() {
        self.opt = OptionalChainOuter {
            mid: null
        };
    }
}
