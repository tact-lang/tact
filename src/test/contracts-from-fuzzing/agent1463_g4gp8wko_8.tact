struct InnerMost {
    f: Int;
}

struct MiddleOpt {
    inner: InnerMost?;
}

struct WrapperOpt {
    middle: MiddleOpt?;
}

contract OptionChainTest {
    top: WrapperOpt;

    init() {
        self.top = WrapperOpt{
            middle: null
        };
    }
}
