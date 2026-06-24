struct WrappedOpt {
    inner: Int?;
}

contract OptStructOptField {
    s: WrappedOpt?;

    init() {
        self.s = null;
    }
}