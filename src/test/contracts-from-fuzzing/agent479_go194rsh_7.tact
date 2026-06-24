struct OptionalInner {
    value: Int?;
}

contract OptionalInPersistent {
    inner: OptionalInner;

    init() {
        self.inner = OptionalInner{ value: null };
    }
}