struct WrappedOpt {
    opt: Int?;
}

contract WrappedOptNull {
    s: WrappedOpt?;

    init() {
        self.s = null;
    }
}