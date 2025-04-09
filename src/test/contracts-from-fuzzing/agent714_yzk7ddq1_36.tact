struct OptionalInner {
    bar: Int?;
}

contract OptionalInnerWrap {
    inner: OptionalInner;

    init() {
        self.inner = OptionalInner{ bar: null };
    }
}