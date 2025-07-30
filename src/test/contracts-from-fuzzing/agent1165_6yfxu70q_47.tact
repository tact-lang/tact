struct OptionalInner {
    nested: Int?;
}

contract OptionalMid {
    inner: OptionalInner?;

    init() {
        self.inner = null;
    }
}
