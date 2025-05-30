struct Inner {
    value: Int;
}

contract OptionalStructField {
    inner: Inner?;

    init() {
        self.inner = null;
    }
}