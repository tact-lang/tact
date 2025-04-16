struct WrappedOpt {
    x: Int?;
}

contract Test {
    opt: WrappedOpt?;

    init() {
        self.opt = null;
    }
}
