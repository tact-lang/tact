struct OptionalInner {
    i: Int?;
}

contract OptStructNullable {
    inner: OptionalInner?;
    init() {
        self.inner = null;
    }
}