struct NullableInner {
    num: Int?;
}

contract OptionalField {
    inner: NullableInner?;

    init() {
        self.inner = null;
    }
}
