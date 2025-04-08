struct WrappedOpt {
    inner: Int?;
}

contract DefaultsOnOptionals {
    w: WrappedOpt;

    init() {
        self.w = WrappedOpt{ inner: null };
    }
}
