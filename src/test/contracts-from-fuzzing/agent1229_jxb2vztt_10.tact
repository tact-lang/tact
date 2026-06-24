struct InnerMost {
    v: Int;
}

struct MiddleOpt {
    inner: InnerMost?;
}

struct OuterOpt {
    middle: MiddleOpt?;
}

contract NestedOptionChain {
    state: OuterOpt;

    init() {
        self.state = OuterOpt{
            middle: MiddleOpt{
                inner: InnerMost{v:99}
            }
        };
    }
}
