struct WrappedOpt {
    inner: Int?;
}

struct DoubleWrap {
    wrap: WrappedOpt?;
}

contract NestedWrapOpt {
    state: DoubleWrap;
    init() {
        self.state = DoubleWrap { wrap: null };
    }
}