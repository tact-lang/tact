struct OptionalInner {
    nested: Int?;
    flag: Bool?;
}

contract OptOptFields {
    inner: OptionalInner?;

    init() {
        self.inner = null;
    }
}