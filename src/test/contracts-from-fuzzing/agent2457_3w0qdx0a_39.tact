struct OuterWrap {
    inner: Int?;
}

contract OptionalNullableInner {
    data: OuterWrap?;
    init() {
        self.data = null;
    }
}