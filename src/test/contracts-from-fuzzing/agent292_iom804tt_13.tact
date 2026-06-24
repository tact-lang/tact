struct WrappedOpt {
    inner: Inner?;
}

struct Inner {
    x: Int;
}

contract WrappedOptField {
    w: WrappedOpt;

    init() {
        self.w = WrappedOpt{ inner: null };
    }
}