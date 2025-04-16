struct WrappedOpt {
    intOpt: Int?;
}

contract NestedWrappedOpt {
    wrapper: WrappedOpt?;
    init() {
        self.wrapper = WrappedOpt{
            intOpt: null,
        };
    }
}