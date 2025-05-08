struct OptionalInner {
    n: Int?;
}

contract NullStructField {
    inner: OptionalInner?;
    init() {
        self.inner = null;
    }
}