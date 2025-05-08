struct WrappedOpt {
    inner: Int?;
}

contract OptInsideStruct {
    s: WrappedOpt;

    init() {
        self.s = WrappedOpt{ inner: null };
    }
}
