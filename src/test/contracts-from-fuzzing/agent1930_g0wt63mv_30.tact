struct Inner {
    p: Int;
}

contract OptionalStructField {
    inner: Inner?;

    init() {
        self.inner = Inner{ p: 42 };
    }
}