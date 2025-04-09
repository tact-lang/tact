struct Inner {
    val: Int = 1;
}

contract OptionalStructField {
    inner: Inner?;
    init() {
        self.inner = null;
    }
}
