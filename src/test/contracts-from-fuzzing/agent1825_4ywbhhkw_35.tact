struct WrappedOpt {
    inner: Int?;
}

contract OptWrap {
    st: WrappedOpt;
    init() {
        self.st = WrappedOpt{inner:null};
    }
}
